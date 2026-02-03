local triplea = {}

local palette = {
	base = "#101928",
	overlay = "#303030",
	muted = "#9a9996",
	text = "#deddda",
	subtle = "#b0afac",
	red = "#ed333b",
	green = "#57e389",
	yellow = "#ff7800",
	blue = "#62a0ea",
	magenta = "#9141ac",
	cyan = "#5bc8af",

	-- brights
	bright_red = "#f66151",
	bright_green = "#8ff0a4",
	bright_yellow = "#ffa348",
	bright_blue = "#99c1f1",
	bright_magenta = "#dc8add",
	bright_cyan = "#93ddc2",
	bright_text = "#f6f5f4",

	-- misc
	misc_primary = "#2f5b97",
}

function triplea.colors()
	return {
		foreground = palette.text,
		background = palette.base,
		cursor_bg = palette.text,
		cursor_border = palette.text,
		cursor_fg = "#1d1d1d",
		selection_bg = palette.overlay,
		selection_fg = "#c0bfbc",

		ansi = {
			"#1d1d1d",
			palette.red,
			palette.green,
			palette.yellow,
			palette.blue,
			palette.magenta,
			palette.cyan,
			palette.text,
		},

		brights = {
			palette.muted,
			palette.bright_red,
			palette.bright_green,
			palette.bright_yellow,
			palette.bright_blue,
			palette.bright_magenta,
			palette.bright_cyan,
			palette.bright_text,
		},

		tab_bar = {
			background = palette.base,

			active_tab = {
				bg_color = palette.misc_primary,
				fg_color = palette.text,
				intensity = "Bold",
			},

			inactive_tab = {
				bg_color = palette.base,
				fg_color = palette.subtle,
			},

			inactive_tab_hover = {
				bg_color = palette.overlay,
				fg_color = palette.text,
			},

			new_tab = {
				bg_color = palette.base,
				fg_color = palette.subtle,
			},

			new_tab_hover = {
				bg_color = palette.overlay,
				fg_color = palette.text,
			},

			inactive_tab_edge = palette.muted,
		},
	}
end

function triplea.window_frame()
	return {
		active_titlebar_bg = palette.base,
		inactive_titlebar_bg = palette.base,
	}
end

return {
	triplea = triplea,
}
