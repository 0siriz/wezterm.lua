local wezterm = require('wezterm')
local act = wezterm.action

local M = {
	{
		key = 'LeftArrow',
		mods = 'LEADER|CTRL',
		action = act.SplitPane({
			direction = 'Left'
		}),
	},
	{
		key = 'UpArrow',
		mods = 'LEADER|CTRL',
		action = act.SplitPane({
			direction = 'Up'
		}),
	},
	{
		key = 'DownArrow',
		mods = 'LEADER|CTRL',
		action = act.SplitPane({
			direction = 'Down'
		}),
	},
	{
		key = 'RightArrow',
		mods = 'LEADER|CTRL',
		action = act.SplitPane({
			direction = 'Right'
		}),
	},
	{
		key = 'h',
		mods = 'LEADER|CTRL',
		action = act.SplitPane({
			direction = 'Left'
		}),
	},
	{
		key = 'j',
		mods = 'LEADER|CTRL',
		action = act.SplitPane({
			direction = 'Down'
		}),
	},
	{
		key = 'k',
		mods = 'LEADER|CTRL',
		action = act.SplitPane({
			direction = 'Up'
		}),
	},
	{
		key = 'l',
		mods = 'LEADER|CTRL',
		action = act.SplitPane({
			direction = 'Right'
		}),
	},
	{
		key = 'LeftArrow',
		mods = 'LEADER',
		action = act.ActivatePaneDirection('Left'),
	},
	{
		key = 'UpArrow',
		mods = 'LEADER',
		action = act.ActivatePaneDirection('Up'),
	},
	{
		key = 'DownArrow',
		mods = 'LEADER',
		action = act.ActivatePaneDirection('Down'),
	},
	{
		key = 'RightArrow',
		mods = 'LEADER',
		action = act.ActivatePaneDirection('Right'),
	},
	{
		key = 'h',
		mods = 'LEADER',
		action = act.ActivatePaneDirection('Left'),
	},
	{
		key = 'j',
		mods = 'LEADER',
		action = act.ActivatePaneDirection('Down'),
	},
	{
		key = 'k',
		mods = 'LEADER',
		action = act.ActivatePaneDirection('Up'),
	},
	{
		key = 'l',
		mods = 'LEADER',
		action = act.ActivatePaneDirection('Right'),
	},
	{
		key = 'q',
		mods = 'LEADER',
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = 'z',
		mods = 'LEADER',
		action = act.TogglePaneZoomState
	},
	{
		key = 'p',
		mods = 'LEADER',
		action = act.PaneSelect
	},
	{
		key = 'p',
		mods = 'LEADER|CTRL',
		action = act.PaneSelect({
			mode = 'SwapWithActive'
		})
	},
}

return M
