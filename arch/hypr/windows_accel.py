#!/usr/bin/env python3

"""Generate a Hyprland custom accel_profile approximating Windows EPP."""

from __future__ import annotations

import argparse
import struct
import subprocess


# Windows registry smooth mouse curve values.
X_CURVE = [
    b"\x00\x00\x00\x00\x00\x00\x00\x00",
    b"\x15\x6e\x00\x00\x00\x00\x00\x00",
    b"\x00\x40\x01\x00\x00\x00\x00\x00",
    b"\x29\xdc\x03\x00\x00\x00\x00\x00",
    b"\x00\x00\x28\x00\x00\x00\x00\x00",
]
Y_CURVE = [
    b"\x00\x00\x00\x00\x00\x00\x00\x00",
    b"\xfd\x11\x01\x00\x00\x00\x00\x00",
    b"\x00\x24\x04\x00\x00\x00\x00\x00",
    b"\x00\xfc\x12\x00\x00\x00\x00\x00",
    b"\x00\xc0\xbb\x01\x00\x00\x00\x00",
]


def fixed_16_16(value: bytes) -> float:
    return struct.unpack("<i", value[:-4])[0] / 0xFFFF


def build_curve(
    *,
    device_dpi: int,
    screen_dpi: int,
    screen_scale: float,
    windows_notch: int,
    samples: int,
) -> tuple[float, list[float]]:
    notch_map = {
        1: 0.1,
        2: 0.2,
        3: 0.4,
        4: 0.6,
        5: 0.8,
        6: 1.0,
        7: 1.2,
        8: 1.4,
        9: 1.6,
        10: 1.8,
        11: 2.0,
    }
    sensitivity_factor = notch_map[windows_notch]
    windows_points = [
        (fixed_16_16(x), fixed_16_16(y)) for x, y in zip(X_CURVE, Y_CURVE)
    ]
    scale_x = device_dpi / 1000.0
    scale_y = screen_dpi / 1000.0 / screen_scale * sensitivity_factor
    points = [(x * scale_x, y * scale_y) for x, y in windows_points]

    def find_segment(x_value: float) -> tuple[tuple[float, float], tuple[float, float]]:
        idx = 0
        while idx < len(points) - 2 and x_value >= points[idx + 1][0]:
            idx += 1
        return points[idx], points[idx + 1]

    def interpolate(x_value: float) -> float:
        (x0, y0), (x1, y1) = find_segment(x_value)
        return ((x_value - x0) * y1 + (x1 - x_value) * y0) / (x1 - x0)

    max_x = points[-2][0]
    step = max_x / (samples - 2)
    sampled = [interpolate(index * step) for index in range(samples)]
    return step, sampled


def format_curve(step: float, points: list[float]) -> str:
    return "custom {:.10f} {}".format(
        step,
        " ".join(f"{point:.3f}" for point in points),
    )


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Generate a Hyprland custom accel_profile approximating Windows acceleration."
    )
    parser.add_argument("--device-dpi", type=int, default=1000)
    parser.add_argument("--screen-dpi", type=int, default=96)
    parser.add_argument("--screen-scale", type=float, default=1.0)
    parser.add_argument("--windows-notch", type=int, default=6, choices=range(1, 12))
    parser.add_argument("--samples", type=int, default=20)
    parser.add_argument("--apply-device", help="Apply live via hyprctl to the given device name.")
    args = parser.parse_args()

    step, points = build_curve(
        device_dpi=args.device_dpi,
        screen_dpi=args.screen_dpi,
        screen_scale=args.screen_scale,
        windows_notch=args.windows_notch,
        samples=args.samples,
    )
    curve = format_curve(step, points)

    if args.apply_device:
        subprocess.run(
            [
                "hyprctl",
                "keyword",
                f"device[{args.apply_device}]:accel_profile",
                curve,
            ],
            check=True,
        )
        return 0

    print(curve)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
