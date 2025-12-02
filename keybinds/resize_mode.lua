local wezterm = require('wezterm')
local act = wezterm.action

local M = {
	{
		key = 'LeftArrow',
		action = act.AdjustPaneSize { 'Left', 1 }
	},
	{
		key = 'h',
		action = act.AdjustPaneSize { 'Left', 1 }
	},
	{
		key = 'RightArrow',
		action = act.AdjustPaneSize { 'Right', 1 }
	},
	{
		key = 'l',
		action = act.AdjustPaneSize { 'Right', 1 }
	},
	{
		key = 'UpArrow',
		action = act.AdjustPaneSize { 'Up', 1 }
	},
	{
		key = 'k',
		action = act.AdjustPaneSize { 'Up', 1 }
	},
	{
		key = 'DownArrow',
		action = act.AdjustPaneSize { 'Down', 1 }
	},
	{
		key = 'j',
		action = act.AdjustPaneSize { 'Down', 1 }
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
