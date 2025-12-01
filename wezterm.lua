local wezterm = require('wezterm')
local keybinds = require('keybinds')
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local config = {}

config.font = wezterm.font({
	family = 'MonaspiceNe Nerd Font',
	harfbuzz_features = {
		'calt',
		'clig',
		'liga',
		-- 'ss01',
		-- 'ss02',
		-- 'ss03',
		-- 'ss04',
		-- 'ss05',
		-- 'ss06',
		-- 'ss07',
		-- 'ss08'
	}
})
config.font_size = 12
config.term = 'wezterm'
config.audible_bell = 'Disabled'
config.color_scheme = 'rose-pine'
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 24
config.show_new_tab_button_in_tab_bar = false
config.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 0.8,
	brightness = 0.7,
}
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.scrollback_lines = 3500
config.disable_default_key_bindings = true
config.leader = keybinds.leader
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables
config.status_update_interval = 500

tabline.setup({
	options = {
		icons_enabled = false,
		theme = 'rose-pine',
		tabs_enabled = true,
		section_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
		component_separators = '│',
		tab_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
		theme_overrides = {
			resize_mode = {
				a = { fg = '#191724', bg = '#eb6f92' },
				b = { fg = '#eb6f92', bg = '#26233a' },
				c = { fg = '#e0def4', bg = '#191724' },
			},
			scroll_mode = {
				a = { fg = '#191724', bg = '#c4a7e7' },
				b = { fg = '#c4a7e7', bg = '#26233a' },
				c = { fg = '#e0def4', bg = '#191724' },
			},
		},
	},
	sections = {
		tabline_a = { 'mode' },
		tabline_b = { 'workspace' },
		tabline_c = { ' ' },
		tab_active = {
			'index',
			{ 'process', padding = { left = 0, right = 1 } },
			{ 'zoomed',  padding = 0 },
		},
		tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
		tabline_x = {},
		tabline_y = { 'datetime', 'hostname' },
		tabline_z = { 'domain' },
	}
})

tabline.apply_to_config(config)

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = wezterm.action.OpenLinkAtMouseCursor,
	}
}

return config
