-- Import the wezterm module
local wezterm = require 'wezterm'
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

config.color_scheme = 'Solarized (dark) (terminal.sexy)'

config.window_decorations = 'RESIZE'


-- Choose your favourite font, make sure it's installed on your machine
config.font = wezterm.font 'Monaco'

-- And a font size that won't have you squinting
config.font_size = 13

config.window_frame = {
  -- Berkeley Mono for me again, though an idea could be to try a
  -- serif font here instead of monospace for a nicer look?
  font = wezterm.font({ family = 'Berkeley Mono', weight = 'Bold' }),
  font_size = 11,
}

config.send_composed_key_when_left_alt_is_pressed = true

-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
