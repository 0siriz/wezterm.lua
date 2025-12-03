local wezterm = require('wezterm')
local act = wezterm.action
local callback = wezterm.action_callback
local mux = wezterm.mux

local M = {
	{
		key = 'w',
		mods = 'LEADER',
		action = act.PromptInputLine {
			description = 'Enter name for new workspace',
			action = callback(function(window, pane, line)
				if line then
					window:perform_action(
						act.SwitchToWorkspace {
							name = line
						},
						pane
					)
				end
			end)
		},
	},
	{
		key = 'w',
		mods = 'LEADER|SHIFT',
		action = act.PromptInputLine {
			description = 'Enter new name for workspace',
			action = callback(function(window, _, line)
				if line then
					mux.rename_workspace(
						window:mux_window():get_workspace(),
						line
					)
				end
			end)
		},
	},
}

return M
