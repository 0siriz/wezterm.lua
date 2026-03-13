local wezterm = require('wezterm')
local act = wezterm.action

local M = {
	{
		key = 'UpArrow',
		action = act.ScrollByLine(-1)
	},
	{
		key = 'k',
		action = act.ScrollByLine(-1)
	},
	{
		key = 'DownArrow',
		action = act.ScrollByLine(1)
	},
	{
		key = 'j',
		action = act.ScrollByLine(1)
	},
	{
		key = 'PageUp',
		action = act.ScrollByPage(-0.5)
	},
	{
		key = 'PageDown',
		action = act.ScrollByPage(0.5)
	},
	{
		key = 'UpArrow',
		mods = 'SHIFT',
		action = act.ScrollToPrompt(-1)
	},
	{
		key = 'k',
		mods = 'SHIFT',
		action = act.ScrollToPrompt(-1)
	},
	{
		key = 'DownArrow',
		mods = 'SHIFT',
		action = act.ScrollToPrompt(1)
	},
	{
		key = 'j',
		mods = 'SHIFT',
		action = act.ScrollToPrompt(1)
	},
	{
		key = 'PageUp',
		mods = 'SHIFT',
		action = act.ScrollToTop
	},
	{
		key = 'PageDown',
		mods = 'SHIFT',
		action = act.ScrollToBottom
	},
	{
		key = 'Escape',
		action = act.PopKeyTable
	},
	{
		key = 'q',
		action = act.PopKeyTable
	},
}

return M
