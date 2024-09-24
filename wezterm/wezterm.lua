local wezterm = require("wezterm")

local background = require("background")
local bindings = require("bindings")
local colorscheme = require("colorscheme")
local config_overrides = require("overrides")

local config = wezterm.config_builder()

bindings.set_bindings(config)
colorscheme.setup(config)
background.set_bg(config)

wezterm.on("window-config-reloaded", function(window)
	config_overrides.apply_overrides(window)
end)

config.default_prog = { "powershell.exe" }
config.launch_menu = {
	{
		label = "PowerShell",
		args = { "powershell.exe" },
	},
}
config.default_cwd = "E:/Lucas/Codes"

config.color_scheme = "Gruvbox dark, hard (base16)"

config.font = wezterm.font("JetBrainsMono NFM")
config.font_size = 16

config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 600

return config
