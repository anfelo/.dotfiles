-- Pull in the wezterm API
local wezterm = require 'wezterm'-- This will hold the configuration.

local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.enable_tab_bar = false
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- For example, changing the color scheme:
config.color_scheme_dirs = { './colors/' }
config.color_scheme = 'rose-pine'

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 16

-- and finally, return the configuration to wezterm
return config
