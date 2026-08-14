-- Minimal Black theme Hyprland overrides.
-- Loaded only while minimal-black is the active theme (omarchy.current.theme.hyprland).

local active_border_color = "#626262"
local inactive_border_color = "rgba(595959aa)"

hl.config({
  general = {
    -- No gaps between windows or borders.
    gaps_in = 0,
    gaps_out = 0,
    border_size = 0,

    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  decoration = {
    blur = {
      enabled = true,
      size = 6,
      passes = 3,
      noise = 0.2,
      brightness = 0.35,
      vibrancy = 0.2,
      vibrancy_darkness = 0.0,
      new_optimizations = true,
      xray = false,
      special = true,
    },
  },
})

-- Subtle transparency so the blur shows through.
o.window(".*", { opacity = "0.94 0.90" })
