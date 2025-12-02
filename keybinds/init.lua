local wezterm = require('wezterm')
local act = wezterm.action

local M = {}

M.leader = {
	key = 'Space',
	mods = 'CTRL',
	timeout_milliseconds = 1000,
}

local function extend(tbl, other)
	for _, value in ipairs(other) do
		table.insert(tbl, value)
	end
end

M.keys = {
	{
		key = 'Enter',
		mods = 'LEADER',
		action = act.SpawnWindow,
	},
	{
		key = 'd',
		mods = 'LEADER',
		action = act.DetachDomain('CurrentPaneDomain'),
	},
	{
		key = 'x',
		mods = 'LEADER',
		action = act.ActivateCopyMode,
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
		key = 's',
		mods = 'LEADER',
		action = act.ActivateKeyTable {
			name = 'scroll_mode',
			one_shot = false,
		}
	},
	{
		key = 'Space',
		mods = 'LEADER',
		action = act.ShowLauncherArgs { flags = 'FUZZY|TABS|WORKSPACES|DOMAINS', title = 'Launcher' },
	},
}

extend(M.keys, require('keybinds.fontsize'))
extend(M.keys, require('keybinds.clipboard'))
extend(M.keys, require('keybinds.panes'))
extend(M.keys, require('keybinds.tabs'))

M.key_tables = {
	resize_mode = require('keybinds.resize_mode'),
	scroll_mode = require('keybinds.scroll_mode'),
}

return M
