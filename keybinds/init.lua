local wezterm = require('wezterm')
local act = wezterm.action
local callback = wezterm.action_callback

local M = {}

M.leader = {
	key = 'Space',
	mods = 'CTRL',
	timeout_milliseconds = 1000,
}

M.keys = {
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
	{
		key = 'Enter',
		mods = 'LEADER',
		action = act.SpawnWindow,
	},
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
		action = act.CloseCurrentPane({confirm = true}),
	},
	{
		key = 'q',
		mods = 'LEADER|SHIFT',
		action = act.CloseCurrentTab({confirm = true}),
	},
	{
		key = 'd',
		mods = 'LEADER|SHIFT',
		action = act.DetachDomain('CurrentPaneDomain'),
	},
	{
		key = 't',
		mods = 'LEADER',
		action = act.SpawnTab('DefaultDomain'),
	},
	{
		key = 't',
		mods = 'LEADER|CTRL',
		action = act.PromptInputLine {
			description = 'Enter new name for tab',
			action = callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end)
		}
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
	{
		key = 'x',
		mods = 'LEADER',
		action = act.ActivateCopyMode,
	},
	{
		key = 's',
		mods = 'LEADER',
		action = act.QuickSelect,
	},
	{
		key = 'r',
		mods = 'LEADER',
		action = act.ActivateKeyTable {
			name = 'resize_mode',
			one_shot = false,
		}
	},
	{
		key = 'w',
		mods = 'LEADER',
		action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES', title = 'Workspaces' },
	},
	{
		key = 'd',
		mods = 'LEADER',
		action = act.ShowLauncherArgs { flags = 'FUZZY|DOMAINS', title = 'Domains' },
	},
	{
		key = 'UpArrow',
		mods = 'CTRL',
		action = act.ScrollByLine(-1),
	},
	{
		key = 'DownArrow',
		mods = 'CTRL',
		action = act.ScrollByLine(1),
	},
	{
		key = 'PageUp',
		mods = 'CTRL',
		action = act.ScrollByPage(-1),
	},
	{
		key = 'PageDown',
		mods = 'CTRL',
		action = act.ScrollByPage(1),
	},
	{
		key = 'UpArrow',
		mods = 'CTRL|SHIFT',
		action = act.ScrollToPrompt(-1),
	},
	{
		key = 'DownArrow',
		mods = 'CTRL|SHIFT',
		action = act.ScrollToPrompt(1),
	},
	{
		key = 'z',
		mods = 'LEADER',
		action = act.TogglePaneZoomState
	},
}

M.key_tables = {
	resize_mode = {
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
	},
}

return M
