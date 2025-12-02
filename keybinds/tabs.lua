local wezterm = require('wezterm')
local act = wezterm.action

local M = {
	{
		key = 't',
		mods = 'LEADER',
		action = act.SpawnTab('CurrentPaneDomain'),
	},
	{
		key = 'Tab',
		mods = 'LEADER',
		action = act.ActivateTabRelative(1),
	},
	{
		key = 'Tab',
		mods = 'LEADER|SHIFT',
		action = act.ActivateTabRelative(-1),
	},
	{
		key = 'q',
		mods = 'LEADER|SHIFT',
		action = act.CloseCurrentTab({ confirm = true }),
	},
}

return M
