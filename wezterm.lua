local wezterm = require('wezterm')
local keybinds = require('keybinds')
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local config = {}

-- Font
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

-- Misc
config.term = 'wezterm'
config.audible_bell = 'Disabled'
config.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 0.8,
	brightness = 0.7,
}
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.scrollback_lines = 3500

-- Color
config.colors = wezterm.color.load_scheme(wezterm.config_dir .. '/colors/rose-pine.toml')

-- Tabline / Statusbar
tabline.setup({
	options = {
		icons_enabled = false,
		theme = config.colors,
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
				a = { fg = config.colors.background, bg = config.colors.ansi[2] },
				b = { fg = config.colors.ansi[2], bg = config.colors.ansi[1] },
				c = { fg = config.colors.ansi[8], bg = config.colors.background },
			},
			scroll_mode = {
				a = { fg = config.colors.background, bg = config.colors.ansi[6] },
				b = { fg = config.colors.ansi[6], bg = config.colors.ansi[1] },
				c = { fg = config.colors.ansi[8], bg = config.colors.background },
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
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.show_new_tab_button_in_tab_bar = false
config.status_update_interval = 500
config.window_decorations = 'RESIZE'
config.colors.tab_bar = config.colors.tab_bar or {}
config.colors.tab_bar.background = require('tabline.config').theme.normal_mode.c.bg

-- Keybinds
config.disable_default_key_bindings = true
config.leader = keybinds.leader
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = wezterm.action.OpenLinkAtMouseCursor,
	}
}

return config
