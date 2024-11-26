-- Pull in WezTerm API
local wezterm = require 'wezterm'

-- Initialize actual config
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

-- Appearance
-- config.color_scheme = 'Neon'
-- config.color_scheme = 'catppuccin-mocha'
config.font_size = 15.0
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

return config
