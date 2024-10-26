-- Imports and Globals
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Basics
config.default_prog = { "zellij", "-l", "welcome" }

-- Appearance
config.background = {
	{
		source = { File = wezterm.config_dir .. "/Heroku Art Mt Fuji.png" },
		vertical_align = "Middle",
	},
}
config.color_scheme = "Catppuccin Mocha (Gogh)"
config.enable_tab_bar = false
config.font_size = 16

return config
