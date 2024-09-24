local wezterm = require("wezterm")
local config_overrides = require("overrides")

local module = {}

function module.setup(config)
	local color_schemes = {
		"Gruvbox dark, hard (base16)",
		"Gruvbox Material (Gogh)",
		"Kanagawa (Gogh)",
		"Sequoia Monochrome",
		"Rosé Pine (Gogh)",
		"Sea Shells (Gogh)",
	}

	local index = 1

	local function cycle_color_scheme(window, _)
		index = (index % #color_schemes) + 1
		local new_scheme = color_schemes[index]
		config_overrides.set_override("color_scheme", new_scheme)
		config_overrides.apply_overrides(window)
	end

	table.insert(config.keys, {
		key = "Y",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(cycle_color_scheme),
	})

	local function show_color_scheme_picker(window, pane)
		window:perform_action(
			wezterm.action.InputSelector({
				title = "Color Schemes",
				choices = color_schemes,
				action = wezterm.action_callback(function(window_act, _, _, label)
					if label then
						config_overrides.set_override("color_scheme", label)
						config_overrides.apply_overrides(window_act)
					end
				end),
			}),
			pane
		)
	end

	table.insert(config.keys, {
		key = "P",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(show_color_scheme_picker),
	})
end

return module
