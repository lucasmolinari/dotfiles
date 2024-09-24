local module = {}

module.overrides = {}

function module.set_override(key, value)
	module.overrides[key] = value
end

function module.apply_overrides(window)
	window:set_config_overrides(module.overrides)
end

return module
