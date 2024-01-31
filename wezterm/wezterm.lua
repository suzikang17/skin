-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

local function dark_schemes()
	local schemes = wezterm.get_builtin_color_schemes()
	local dark = {}
	for name, scheme in pairs(schemes) do
		-- parse into a color object
		local bg = wezterm.color.parse(scheme.background)
		-- and extract HSLA information
		local h, s, l, a = bg:hsla()

		-- `l` is the "lightness" of the color where 0 is darkest
		-- and 1 is lightest.
		if l < 0.4 then
			table.insert(dark, name)
		end
	end

	table.sort(dark)
	return dark
end

local dark = dark_schemes()
local scheme = dark[math.random(#dark)]

wezterm.on("window-config-reloaded", function(window, pane)
	-- If there are no overrides, this is our first time seeing
	-- this window, so we can pick a random scheme.
	if not window:get_config_overrides() then
		-- Pick a random scheme name

		window:set_config_overrides({
			color_scheme = scheme,
		})
	end
end)

wezterm.on("update-right-status", function(window, pane)
	local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")

	-- Make it italic and underlined
	window:set_right_status(wezterm.format({
		{ Attribute = { Underline = "Single" } },
		{ Attribute = { Italic = true } },
		{ Text = "Colorscheme:" .. scheme },
	}))
end)

config.hide_tab_bar_if_only_one_tab = true

wezterm.log_info(config)

-- and finally, return the configuration to wezterm
return config
