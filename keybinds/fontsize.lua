local wezterm = require('wezterm')
local act = wezterm.action

local M = {
	{
		key = '+',
		mods = 'LEADER',
		action = act.IncreaseFontSize,
	},
	{
		key = '-',
		mods = 'LEADER',
		action = act.DecreaseFontSize,
	},
	{
		key = '0',
		mods = 'LEADER',
		action = act.ResetFontSize,
	},
}

return M
