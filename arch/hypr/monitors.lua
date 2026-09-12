-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = "auto"

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Keep workspaces 1–8 on the primary display.
for workspace = 1, 8 do
  hl.workspace_rule({
    workspace = tostring(workspace),
    monitor = "HDMI-A-1",
    persistent = true,
  })
end

-- Keep workspaces 9–10 on the secondary display.
for workspace = 9, 10 do
  hl.workspace_rule({
    workspace = tostring(workspace),
    monitor = "DP-3",
    persistent = true,
  })
end
