local wezterm = require('wezterm')
local act = wezterm.action

local M = {
	{
		key = 't',
		mods = 'LEADER',
		action = act.SpawnTab('CurrentPaneDomain'),
	},
	{
		key = 't',
		mods = 'LEADER|SHIFT',
		action = act.PromptInputLine {
			description = 'Enter new name for tab',
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end)
		},
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
