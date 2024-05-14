local wezterm = require("wezterm")
local config = {}

config.default_prog = { "powershell.exe"}
config.launch_menu = {
	{
		label = "PowerShell",
		args = { "powershell.exe"},
	},
}
config.default_cwd = "G:/codes/"

config.color_scheme = "Gruvbox Material (Gogh)"

config.font = wezterm.font("FantasqueSansM Nerd Font")
config.font_size = 16

config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	{
		key = "f",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 600

return config
