local wezterm = require("wezterm")
-- this will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("Maple Mono NF Light")
config.font_size = 17.0
config.color_scheme = "tokyonight_night"

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

return config
