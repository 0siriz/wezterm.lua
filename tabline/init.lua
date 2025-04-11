local wezterm = require('wezterm')

local M = {}

local function insert_elements(dest, src)
	for _, v in ipairs(src) do
		table.insert(dest, v)
	end
end

function M.setup(opts)
	wezterm.on('update-status', function(window, pane)
		local mode = window:active_key_table()

		local left_status = {}

		if window:leader_is_active() then
			insert_elements(left_status, {
				{ Foreground = { Color = opts.leader.fg } },
				{ Background = { Color = opts.leader.bg } },
				{ Attribute = { Intensity = 'Bold' } },
				{ Text = ' ' .. string.upper(opts.leader.text) .. ' ' },
				'ResetAttributes',
			})
		end

		if pane:get_domain_name() ~= 'local' then
			insert_elements(left_status, {
				{ Foreground = { Color = opts.domain.fg } },
				{ Background = { Color = opts.domain.bg } },
				{ Attribute = { Intensity = 'Bold' } },
				{ Text = ' ' .. pane:get_domain_name() .. ' ' },
				'ResetAttributes',
			})
		end

		insert_elements(left_status, {
			{ Foreground = { Color = opts.hostname.fg } },
			{ Background = { Color = opts.hostname.bg } },
			{ Attribute = { Intensity = 'Bold' } },
			{ Text = ' ' .. wezterm.hostname() .. ' ' },
			'ResetAttributes',
			{ Text = '' },
		})

		if mode then
			insert_elements(left_status, {
				{ Foreground = { Color = opts.modes[mode].fg } },
				{ Background = { Color = opts.modes[mode].bg } },
				{ Attribute = { Intensity = 'Bold' } },
				{ Text = ' ' .. string.upper(opts.modes[mode].text) .. ' ' },
				'ResetAttributes',
			})
		end

		window:set_left_status(wezterm.format(left_status))
	end)

	local function tab_title(tab_info)
		local title = tab_info.tab_index .. ': '

		if tab_info.active_pane.is_zoomed then
			title = title .. '[Z] '
		end

		local set_title = tab_info.tab_title

		if set_title == '' then
			local pane_title = string.gsub(tab_info.active_pane.title, 'Copy mode: ', '')
			set_title = pane_title
		end

		title = title .. set_title

		return title
	end

	local function truncate(s, width)
		if s:len() > width then
			return s:sub(1, width-3) .. '...'
		end
		return s
	end

	wezterm.on('format-tab-title', function(tab, _, _, config, hover, max_width)
		local title = tab_title(tab)

		local output = {}
		if tab.is_active then
			table.insert(output, { Background = { Color = config.colors.tab_bar.active_tab.bg_color } })
			table.insert(output, { Foreground = { Color = config.colors.tab_bar.active_tab.fg_color } })
		elseif hover then
			table.insert(output, { Background = { Color = config.colors.tab_bar.inactive_tab_hover.bg_color } })
			table.insert(output, { Foreground = { Color = config.colors.tab_bar.inactive_tab_hover.fg_color } })
		else
			table.insert(output, { Background = { Color = config.colors.tab_bar.inactive_tab.bg_color } })
			table.insert(output, { Foreground = { Color = config.colors.tab_bar.inactive_tab.fg_color } })
		end
		table.insert(output, { Text = ' ' .. truncate(title, max_width-2) .. ' ' })
		return output
	end)
end

return M
