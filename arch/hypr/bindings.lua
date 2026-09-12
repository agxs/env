-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Personal keybindings migrated from bindings.conf.
-- Caps Lock is mapped to Hyper (SUPER + SHIFT + ALT + CTRL) outside Hyprland.

local hyper = "SUPER + SHIFT + ALT + CTRL"

-- Remove Omarchy bindings replaced or disabled by the personal bindings below.
local default_bindings_to_remove = {
  "SUPER + W", -- Close window
  "SUPER + J", -- Toggle window split
  "SUPER + P", -- Pseudo window
  "SUPER + T", -- Toggle window floating/tiling
  "SUPER + F", -- Full screen (replaced with file manager)
  "SUPER + CTRL + F", -- Tiled full screen
  "SUPER + ALT + F", -- Full width
  "SUPER + LEFT", -- Focus left
  "SUPER + RIGHT", -- Focus right
  "SUPER + UP", -- Focus up
  "SUPER + DOWN", -- Focus down
  "SUPER + TAB", -- Next workspace
  "SUPER + SHIFT + TAB", -- Previous workspace
  "SUPER + CTRL + TAB", -- Former workspace
  "SUPER + SHIFT + LEFT", -- Swap window left
  "SUPER + SHIFT + RIGHT", -- Swap window right
  "SUPER + SHIFT + UP", -- Swap window up
  "SUPER + SHIFT + DOWN", -- Swap window down
  "ALT + TAB", -- Focus/reveal next window
  "ALT + SHIFT + TAB", -- Focus/reveal previous window
  "SUPER + code:20", -- Resize left (- key)
  "SUPER + code:21", -- Resize right (= key)
  "SUPER + SHIFT + code:20", -- Resize up
  "SUPER + SHIFT + code:21", -- Resize down
  "SUPER + G", -- Toggle window grouping
  "SUPER + ALT + G", -- Move window out of group
  "SUPER + ALT + LEFT", -- Move window into group on left
  "SUPER + ALT + RIGHT", -- Move window into group on right
  "SUPER + ALT + UP", -- Move window into group above
  "SUPER + ALT + DOWN", -- Move window into group below
  "SUPER + ALT + TAB", -- Next window in group
  "SUPER + ALT + SHIFT + TAB", -- Previous window in group
  "SUPER + S", -- Toggle scratchpad
  "SUPER + mouse:272", -- Move window
  "SUPER + mouse:273", -- Resize window
  "SUPER + O", -- Pop window out

  -- Application bindings replaced below.
  "SUPER + RETURN",
  "SUPER + SHIFT + RETURN",
  "SUPER + ALT + RETURN",
  "SUPER + SHIFT + B",
}

for _, keys in ipairs(default_bindings_to_remove) do
  hl.unbind(keys)
end

-- Omarchy's default workspace bindings are replaced by Caps/Hyper bindings.
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.unbind("SUPER + " .. key)
  hl.unbind("SUPER + SHIFT + " .. key)
end

-- Omarchy's default group-number bindings are disabled.
for index = 1, 5 do
  hl.unbind("SUPER + ALT + code:" .. tostring(index + 9))
end

-- Applications.
o.bind("SUPER + ALT + RETURN", "Tmux", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" tmux new')
o.bind("SUPER + Q", "Close active window", hl.dsp.window.close())
o.bind("SUPER + RETURN", "Terminal", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)"')
o.bind("SUPER + SHIFT + RETURN", "Browser", "omarchy-launch-browser")
o.bind("SUPER + F", "File manager", "uwsm-app -- nautilus --new-window")
o.bind("SUPER + SHIFT + B", "Browser", "firefox")

-- Switch workspaces with Caps/Hyper + 1–0.
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  o.bind(
    hyper .. " + " .. key,
    "Switch to workspace " .. workspace,
    hl.dsp.focus({ workspace = tostring(workspace) })
  )
end

-- Focus a monitor directly.
o.bind(hyper .. " + W", "Switch to main monitor", hl.dsp.focus({ monitor = "HDMI-A-1" }))
o.bind(hyper .. " + E", "Switch to second monitor", hl.dsp.focus({ monitor = "DP-3" }))

-- Window state.
o.bind(hyper .. " + PERIOD", "Toggle split", hl.dsp.layout("togglesplit"))
o.bind(hyper .. " + T", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
o.bind(hyper .. " + F", "Force full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Move focus with Caps/Hyper + H/J/K/L.
o.bind(hyper .. " + H", "Move focus left", hl.dsp.focus({ direction = "l" }))
o.bind(hyper .. " + L", "Move focus right", hl.dsp.focus({ direction = "r" }))
o.bind(hyper .. " + K", "Move focus up", hl.dsp.focus({ direction = "u" }))
o.bind(hyper .. " + J", "Move focus down", hl.dsp.focus({ direction = "d" }))

-- Move windows with Caps/Hyper + Y/U/I/O.
o.bind(hyper .. " + Y", "Move window left", hl.dsp.window.move({ direction = "l" }))
o.bind(hyper .. " + O", "Move window right", hl.dsp.window.move({ direction = "r" }))
o.bind(hyper .. " + I", "Move window up", hl.dsp.window.move({ direction = "u" }))
o.bind(hyper .. " + U", "Move window down", hl.dsp.window.move({ direction = "d" }))

-- Move the active window to a workspace with Alt + Shift + 1–0.
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  o.bind(
    "ALT + SHIFT + " .. key,
    "Move window to workspace " .. workspace,
    hl.dsp.window.move({ workspace = tostring(workspace) })
  )
end

-- Move and resize windows with Super + Shift + mouse dragging.
o.bind("SUPER + SHIFT + mouse:272", "Move window", hl.dsp.window.drag(), { mouse = true })
o.bind("SUPER + SHIFT + mouse:273", "Resize window", hl.dsp.window.resize(), { mouse = true })
