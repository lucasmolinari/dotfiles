local module = {}

function module.set_bg(config)
	config.background = {
		{
			source = {
				File = { path = "C:/Users/Lucas/.config/wezterm/backgrounds/blue-mountains.png" },
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
end

return module
