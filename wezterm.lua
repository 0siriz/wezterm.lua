local wezterm = require('wezterm')
local rosepine = require('colorschemes/rose-pine')
local keybinds = require('keybinds')
local tabline = require('tabline')

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
config.colors = rosepine.colors()
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
	modes = {
		copy_mode = {
			fg = rosepine.palette.base,
			bg = rosepine.palette.iris,
			text = 'copy',
		},
		resize_mode = {
			fg = rosepine.palette.base,
			bg = rosepine.palette.love,
			text = 'resize',
		},
	},
	leader = {
		fg = rosepine.palette.base,
		bg = rosepine.palette.pine,
		text = 'leader',
	},
	domain = {
		fg = rosepine.palette.base,
		bg = rosepine.palette.gold,
	},
	hostname = {
		fg = rosepine.palette.base,
		bg = rosepine.palette.foam,
	}
})

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = wezterm.action.OpenLinkAtMouseCursor,
	}
}

return config
