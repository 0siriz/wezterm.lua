local wezterm = require('wezterm')
local act = wezterm.action

local M = {
	{
		key = 'c',
		mods = 'LEADER',
		action = act.CopyTo('Clipboard'),
	},
	{
		key = 'v',
		mods = 'LEADER',
		action = act.PasteFrom('Clipboard'),
	},
	{
		key = 'c',
		mods = 'CTRL|SHIFT',
		action = act.CopyTo('Clipboard'),
	},
	{
		key = 'v',
		mods = 'CTRL|SHIFT',
		action = act.PasteFrom('Clipboard')
	},
}

return M
