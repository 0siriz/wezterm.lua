local M = {}

M.palette = {
	base = '#191724',
	surface = '#1f1d2e',
	overlay = '#26233a',
	muted = '#6e6a86',
	text = '#e0def4',
	love = '#eb6f92',
	gold = '#f6c177',
	rose = '#ebbcba',
	pine = '#31748f',
	foam = '#9ccfd8',
	iris = '#c4a7e7',
	highlight_low = '#21202e',
	highlight_med = '#403d52',
	highlight_high = '#524f67',
}

local active_tab = {
	bg_color = M.palette.overlay,
	fg_color = M.palette.text,
}

local inactive_tab = {
	bg_color = M.palette.base,
	fg_color = M.palette.muted,
}

function M.colors()
	return {
		foreground = M.palette.text,
		background = M.palette.base,
		cursor_bg = M.palette.highlight_high,
		cursor_border = M.palette.highlight_high,
		cursor_fg = M.palette.text,
		selection_bg = M.palette.highlight_low,
		selection_fg = M.palette.text,
		split = M.palette.highlight_high,

		ansi = {
			M.palette.overlay,
			M.palette.love,
			M.palette.pine,
			M.palette.gold,
			M.palette.foam,
			M.palette.iris,
			M.palette.rose,
			M.palette.text,
		},

		brights = {
			M.palette.muted,
			M.palette.love,
			M.palette.pine,
			M.palette.gold,
			M.palette.foam,
			M.palette.iris,
			M.palette.rose,
			M.palette.text,
		},

		tab_bar = {
			background = M.palette.base,
			active_tab = active_tab,
			inactive_tab = inactive_tab,
			inactive_tab_hover = active_tab,
		},
	}
end

return M
