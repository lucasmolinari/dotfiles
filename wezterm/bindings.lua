local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

function module.set_bindings(config)
	config.keys = {
		-- Env
		{ key = "e", mods = "CTRL", action = act.SendString("env/Scripts/activate\n") },
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
			mods = "CTRL|SHIFT",
			action = act.SpawnCommandInNewTab({
				cwd = "E:/Lucas/codes/",
				domain = "CurrentPaneDomain",
			}),
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = act.SpawnCommandInNewTab({
				cwd = "C:/Users/Lucas/.config",
				domain = "CurrentPaneDomain",
			}),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = act.SpawnCommandInNewTab({
				cwd = wezterm.home_dir .. "/AppData/Local/nvim",
				domain = "CurrentPaneDomain",
			}),
		},
		{
			key = "w",
			mods = "CTRL",
			action = act.CloseCurrentTab({ confirm = true }),
		},
	}
	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "CTRL",
			action = act.ActivateTab(i - 1),
		})
	end
end

return module
