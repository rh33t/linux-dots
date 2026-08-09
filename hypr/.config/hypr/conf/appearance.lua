hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 2,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(7dcfffee)", "rgba(7aa2f7ee)" }, angle = 45 },
			inactive_border = "rgba(3b4261aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		layout = "dwindle",
	},

	dwindle = {
		preserve_split = true,
	},

	-- Groupbar font size
	group = {
		groupbar = {
			font_size = 13,
			height = 12,
		},
	},

	decoration = {

		rounding = 4,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 2,
		},
	},

	animations = {
		enabled = false,
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = true,
	},
})

-- Speed in deciseconds (1 = 100ms).
-- easeOutExpo: fast-start, smooth-stop. Cheaper than spring physics.
-- easeInExpo: quick ramp-up for exits.
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("easeInExpo", { type = "bezier", points = { { 0.7, 0 }, { 0.84, 0 } } })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 2.5, bezier = "easeOutExpo", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "easeInExpo", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2.5, bezier = "easeOutExpo" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "easeOutExpo" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "easeOutExpo" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2.5, bezier = "easeOutExpo", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.5, bezier = "easeOutExpo", style = "slidevert" })
