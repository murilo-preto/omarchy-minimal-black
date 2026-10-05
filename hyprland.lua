-- Minimal Black theme Hyprland overrides.
-- Loaded only while minimal-black is the active theme.
--
-- NOTE: Omarchy refuses to stage *.lua from a theme installed via
-- `omarchy theme install` (it would be running a stranger's code). This file
-- takes effect only when the theme directory is one you wrote yourself or a
-- symlink to your own working copy. See README.

-- Hairline translucent edges, like macOS window chrome.
local active_border_color = "rgba(e7e9ea33)"
local inactive_border_color = "rgba(e7e9ea14)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },

    border_size = 1,

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

    -- Soft drop shadow so glass panes float above the wallpaper.
    shadow = {
      enabled = true,
      range = 24,
      render_power = 3,
      color = "rgba(00000066)",
    },

    blur = {
      enabled = true,
      size = 8,
      passes = 3,
      contrast = 1.02,
      brightness = 1.00,
      vibrancy = 0.20,
      vibrancy_darkness = 0.15,
      noise = 0.02,
      -- Blur behind app-side alpha too, e.g. the terminal's own window opacity.
      ignore_opacity = true,
      new_optimizations = true,
    },

    -- Global window opacity (as in amekoji), so every window -- browsers
    -- included -- is a little transparent. Multiplies with window rules.
    active_opacity = 0.90,
    inactive_opacity = 0.88,
    fullscreen_opacity = 1.0,
  },
})

-- Subtle window transparency so the blur shows through. Overrides Omarchy's
-- default "0.985 0.96". Scoped to the default-opacity tag; apps that opt out
-- (browsers, steam, qemu, video web apps, picture-in-picture) get only the
-- global opacity above.
o.window({ tag = "default-opacity" }, { opacity = "0.94 0.90" })

-- Glass for shell surfaces (see shell.toml): blur behind the bar, menus,
-- notifications, OSD and popups. ignore_alpha sits between the scrims
-- (<= 0.30) and the cards (>= 0.55), so only the cards get blurred, not the
-- full-screen dim layer behind a menu.
hl.layer_rule({
  match = { namespace = "^omarchy-(bar|menu|clipboard|emojis|keyboard-panel|notifications|osd|polkit|reminders|network-qr)$" },
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.4,
})
