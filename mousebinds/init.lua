local wezterm = require('wezterm')
local act = wezterm.action

local M = {}
M.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = 'Left' } },
		mods = 'NONE',
		action = act.SelectTextAtMouseCursor('Line'),
	},
	{
		event = { Down = { streak = 2, button = 'Left' } },
		mods = 'NONE',
		action = act.SelectTextAtMouseCursor('Word'),
	},
	{
		event = { Down = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = act.SelectTextAtMouseCursor('Cell'),
	},
	{
		event = { Down = { streak = 1, button = 'Left' } },
		mods = 'SHIFT',
		action = act.ExtendSelectionToMouseCursor('Cell'),
	},
	{
		event = { Down = { streak = 1, button = 'Left' } },
		mods = 'ALT',
		action = act.SelectTextAtMouseCursor('Block'),
	},
	{
		event = { Down = { streak = 1, button = 'Left' } },
		mods = 'SHIFT|ALT',
		action = act.ExtendSelectionToMouseCursor('Block'),
	},
	{
		event = { Down = { streak = 1, button = 'Middle' } },
		mods = 'NONE',
		action = act.PasteFrom('PrimarySelection'),
	},
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = act.CompleteSelectionOrOpenLinkAtMouseCursor('PrimarySelection'),
	},
	{
		event = { Up = { streak = 2, button = 'Left' } },
		mods = 'NONE',
		action = act.CompleteSelection('PrimarySelection'),
	},
	{
		event = { Up = { streak = 3, button = 'Left' } },
		mods = 'NONE',
		action = act.CompleteSelection('PrimarySelection'),
	},
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'SHIFT',
		action = act.CompleteSelectionOrOpenLinkAtMouseCursor('PrimarySelection'),
	},
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'ALT',
		action = act.CompleteSelection('PrimarySelection'),
	},
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'SHIFT|ALT',
		action = act.CompleteSelection('PrimarySelection'),
	},
	{
		event = { Drag = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = act.ExtendSelectionToMouseCursor('Cell'),
	},
	{
		event = { Drag = { streak = 2, button = 'Left' } },
		mods = 'NONE',
		action = act.ExtendSelectionToMouseCursor('Word')
	},
	{
		event = { Drag = { streak = 3, button = 'Left' } },
		mods = 'NONE',
		action = act.ExtendSelectionToMouseCursor('Line')
	},
	{
		event = { Drag = { streak = 1, button = 'Left' } },
		mods = 'ALT',
		action = act.ExtendSelectionToMouseCursor('Block'),
	},
	{
		event = { Drag = { streak = 1, button = 'Left' } },
		mods = 'SUPER',
		action = act.StartWindowDrag,
	},
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = 'NONE',
		action = act.ScrollByLine(-3),
		alt_screen = false,
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = 'NONE',
		action = act.ScrollByLine(3),
		alt_screen = false,
	},
}

return M
