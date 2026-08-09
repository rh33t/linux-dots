-- Hyprland collapses X11 class and Wayland app_id into a single class.
-- Syntax: https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- single global scrolling config
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
	misc = {
		initial_workspace_tracking = false,
	},
})

-- per-workspace layout assignment
hl.workspace_rule({ workspace = "7", layout = "scrolling" })

-- No gaps/border/rounding on single-tile workspaces. From wiki
-- Workspace-Rules recipe.
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })

-- Blur allowlist: global blur is on (appearance.lua), everything opts out
-- except these classes.
local blur_allowlist = { "foot", "code" }
hl.window_rule({ match = { class = ".*" }, no_blur = true })
for _, class in ipairs(blur_allowlist) do
	hl.window_rule({ match = { class = class }, no_blur = false })
end

-- Workspace assignment
local workspace_assignments = {
	-- silent = false lets kitty/foot on ws1 pull focus (daily journal terminal).
	{ match = { class = "kitty", title = "^daily" }, workspace = "1", silent = false },
	{ match = { class = "foot", title = "^daily" }, workspace = "1", silent = false },
	{ match = { class = "code" }, workspace = "2" },
	{ match = { class = ".*(?i)jetbrains-.*" }, workspace = "2" },
	{ match = { class = ".*(?i)brave.*" }, workspace = "3" },
	{ match = { class = "org.telegram.desktop" }, workspace = "4" },
	{ match = { class = "discord" }, workspace = "4" },
	{ match = { class = "brave-hnpfjngllnobngcgfapefoaidbinmjnm-Default" }, workspace = "4" },
	{ match = { class = "obsidian" }, workspace = "5" },
	{ match = { class = "spotify" }, workspace = "6" },
	-- { match = { class = ".*(?i)VirtualBox.*|.*virt-manager.*|.*vmware.*" }, workspace = "7" },
	{ match = { class = "com.obsproject.Studio" }, workspace = "8" },
	{ match = { class = "proton.vpn.app.gtk" }, workspace = "10" },
}

for _, a in ipairs(workspace_assignments) do
	local silent = a.silent
	if silent == nil then
		silent = true
	end
	hl.window_rule({
		match = a.match,
		workspace = silent and (a.workspace .. " silent") or a.workspace,
		no_shadow = not a.shadow, -- opt in per-entry: shadow = true
	})
end

-- Opacity
-- Active | Inactive | Fullscreen
hl.window_rule({
	match = { class = "foot" },
	opacity = "0.85 override 0.85 override 0.85 override",
})
hl.window_rule({
	match = { class = "kitty" },
	opacity = "0.85 override 0.85 override 0.85 override",
})
hl.window_rule({
	match = { class = "code" },
	opacity = "0.95 override 0.8 override 0.9 override",
})

-- Borderless apps
-- Emulator draws its own device skin (rounded bezel); Hyprland's own
-- rounding/shadow clip against that skin at a different radius/shape,
-- producing mismatched corners and a boxy shadow. Kill both.
hl.window_rule({ match = { class = "Emulator" }, border_size = 0, rounding = 0, no_shadow = true })

-- Floating rules
local function floatcentered(class, size, extra)
	local match = { class = "(?i)" .. class }
	if extra then
		for k, v in pairs(extra) do
			match[k] = v
		end
	end
	local rule = { match = match, float = true, center = true }
	if size then
		rule.size = size
	end
	hl.window_rule(rule)
end

floatcentered("shortcut", { 1280, 720 })
floatcentered(".*", { 1600, 900 }, { title = "Shortcut: OpenCode VM" })
floatcentered("com.github.hluk.copyq", { 800, 600 })
floatcentered("GParted", { 800, 600 })
floatcentered("nwg-look", { 800, 600 })
floatcentered("Nm-connection-editor", { 800, 600 })
floatcentered("kvantummanager", { 800, 600 })
floatcentered("org.gnome.DiskUtility", { 800, 600 })
floatcentered("xdg-desktop-portal-gtk", { 800, 600 })
floatcentered("hyprland-share-picker", { 800, 600 })

floatcentered("Anydesk")
floatcentered("com.github.wwmm.easyeffects", { 1280, 720 })
floatcentered("Seahorse")
floatcentered("org.pulseaudio.pavucontrol")
floatcentered("qt5ct", { 800, 600 })
floatcentered("qt6ct", { 800, 600 })
floatcentered(".*", nil, { title = "^Welcome to.*" })
floatcentered("thunar", nil, { title = "^(Rename |File Operation Progress$)" })
floatcentered("brave-nngceckbapebfimnlniiiahkandclblb-Default", { 400, 600 }) -- bitwarden extension

hl.window_rule({ match = { class = "Emulator" }, float = true })
hl.window_rule({ match = { class = "flameshot" }, float = true })

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

local suppress_maximize_rule = hl.window_rule({
	-- Ignore maximize requests from all apps.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppress_maximize_rule:set_enabled(true)
