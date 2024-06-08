local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

function module.set_bindings(config)
	config.keys = {
		-- Window
		{ key = "q", mods = "CTRL", action = act.QuitApplication },
		{
			key = "f",
			mods = "CTRL",
			action = act.ToggleFullScreen,
		},

		-- Pane
		{
			key = "h",
			mods = "CTRL|ALT",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "v",
			mods = "CTRL|ALT",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CTRL|ALT",
			action = act.CloseCurrentPane({ confirm = false }),
		},
		{ key = "8", mods = "CTRL", action = act.PaneSelect },

		-- Tab
		{
			key = "t",
			mods = "SHIFT|ALT",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "w",
			mods = "CTRL",
			action = act.CloseCurrentTab({ confirm = true }),
		},
	}
end

return module
