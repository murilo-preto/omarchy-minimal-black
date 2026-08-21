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
    rounding = 14,
    shadow = {
      enabled = false,
      range = 15,
      render_power = 5,
      offset = "0 0",
    },
    blur = {
      enabled = true,
      size = 5,
      passes = 3,
      contrast = 1.02,
      brightness = 1.00,
      vibrancy = 0.12,
      vibrancy_darkness = 0.15,
      noise = 0.02,
      ignore_opacity = true,
      new_optimizations = true,
    },
    active_opacity = 0.90,
    inactive_opacity = 0.88,
    fullscreen_opacity = 1.0,
  },

})

-- Subtle transparency so the blur shows through.
o.window(".*", { opacity = "0.94 0.90" })
