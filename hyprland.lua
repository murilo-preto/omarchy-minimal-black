-- Minimal Black theme Hyprland overrides.
-- Loaded only while minimal-black is the active theme.
--
-- NOTE: Omarchy refuses to stage *.lua from a theme installed via
-- `omarchy theme install` (it would be running a stranger's code). This file
-- takes effect only when the theme directory is one you wrote yourself or a
-- symlink to your own working copy. See README.

local active_border_color = "#626262"
local inactive_border_color = "rgba(595959aa)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },

    -- Edge-to-edge: no gaps between windows, no borders.
    -- Uncomment for the full minimal look.
    -- gaps_in = 0,
    -- gaps_out = 0,
    -- border_size = 0,
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
      -- Blur behind app-side alpha too, e.g. the terminal's own window opacity.
      ignore_opacity = true,
      new_optimizations = true,
    },
  },
})

-- Subtle window transparency so the blur shows through. Overrides Omarchy's
-- default "0.985 0.96". Scoped to the default-opacity tag so apps that opt out
-- (steam, qemu, video web apps, picture-in-picture) stay fully opaque.
o.window({ tag = "default-opacity" }, { opacity = "0.94 0.90" })
