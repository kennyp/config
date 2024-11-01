-- Imports and Globals
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local path = {
	wezterm.home_dir .. "/bin",
	wezterm.home_dir .. "/.cargo/bin",
	"/opt/homebrew/bin",
	"/usr/local/bin",
	wezterm.home_dir .. "/.asdf/shims",
	wezterm.home_dir .. "/.asdf/bin",
	"/usr/bin",
	"/bin",
	"/usr/sbin",
	"/sbin",
}

-- Basics
config.default_prog = { "zellij", "-l", "welcome" }
config.set_environment_variables = {
	PATH = table.concat(path, ":"),
}

-- Appearance
config.animation_fps = 30
config.background = {
	{
		source = { File = wezterm.config_dir .. "/heroku.png" },
		vertical_align = "Middle",
		horizontal_align = "Center",
	},
}
config.color_scheme = "Catppuccin Mocha (Gogh)"
config.enable_tab_bar = false
config.font_size = 16
config.max_fps = 120

return config
