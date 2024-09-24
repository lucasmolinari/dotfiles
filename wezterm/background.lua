local wezterm = require("wezterm")
local config_overrides = require("overrides")

local module = {}

local background_enabled = true

local background_config = {
	{
		source = {
			File = { path = "C:/Users/Lucas/.config/wezterm/backgrounds/background.jpg" },
		},
		height = "Cover",
		width = "Cover",
		horizontal_align = "Left",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		attachment = "Fixed",
		opacity = 100,
		hsb = { brightness = 0.1 },
	},
}

function module.set_bg(config)
	if background_enabled then
		config.background = background_config
	end
end

function module.toggle_background(window)
	background_enabled = not background_enabled
	if background_enabled then
		config_overrides.set_override("background", background_config)
	else
		config_overrides.set_override("background", {})
	end
	config_overrides.apply_overrides(window)
end

return module
