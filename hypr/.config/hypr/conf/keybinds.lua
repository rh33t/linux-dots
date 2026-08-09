-- Syntax reference:
-- https://wiki.hypr.land/Configuring/Basics/Binds
-- https://wiki.hypr.land/Configuring/Basics/Dispatchers

local mainMod = "SUPER"
local altMod = "ALT"

-- Workspace switching
-- Physical keycode notation (code:N): AZERTY layers digits behind SHIFT, so
-- matching keysym would break. Keycodes 10-19 are the number row.
for i = 1, 10 do
	local kc = i + 9 -- Keycodes 10..19
	hl.bind(mainMod .. " + code:" .. kc, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + code:" .. kc, hl.dsp.window.move({ workspace = i }))
end

hl.bind(altMod .. " + code:10", hl.dsp.focus({ workspace = 11 }))
hl.bind(mainMod .. " + " .. altMod .. " + code:10", hl.dsp.window.move({ workspace = 11 }))

-- fast vm workspace bind : meta+œ on french kbd
hl.bind(mainMod .. " + code:49", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. "+ SHIFT + code:49", hl.dsp.window.move({ workspace = 7 }))

-- Cosmetic labels for waybar; keybinds still reference number.
-- hl.workspace_rule({ workspace = "7", default_name = "vm" })
-- hl.workspace_rule({ workspace = "11", default_name = "bw" })

hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "-1" }))

-- Special workspace
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("whoop"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:whoop" }))

-- Window management
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. "+ SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Dwindle has no manual split; preselect sets direction for the next
-- window.
hl.bind(mainMod .. " + M", hl.dsp.layout("preselect r"))
hl.bind(mainMod .. " + Z", hl.dsp.layout("preselect d"))

-- Tabbed/stacking map to window groups. No separate stacking, so S
-- cycles within a group instead.
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + S", hl.dsp.group.next())

hl.bind(mainMod .. " + R", hl.dsp.layout("togglesplit"))

-- Toggle current workspace between dwindle and scrolling layout.
hl.bind(mainMod .. " + K", function()
	local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
	if not workspace then
		return
	end

	local next_layout = workspace.tiled_layout == "scrolling" and "dwindle" or "scrolling"

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
end)
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float())

-- Focus parent/mode_toggle don't map to dwindle/master. Left unbound.
hl.bind(mainMod .. " + X", hl.dsp.focus({ urgent_or_last = true }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))

-- Move/resize with mainMod + mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize controls
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })

-- Hypr control
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Applications
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("foot --title daily -e tmux new-session -A -s daily"))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd('kitty --title "daily" zsh -c "tmux new -A -s daily"'))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("foot --working-directory=$HOME -e zsh"), { repeating = true })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("/usr/bin/thunar"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("/usr/bin/brave-origin"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd("~/.config/hypr/scripts/websearch"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("copyq show"))
hl.bind(
	mainMod .. " + space",
	hl.dsp.exec_cmd(
		"rofi -show combi -modi window,drun,combi -combi-modi window,drun -config ~/.config/rofi/rofidmenu.rasi -matching fuzzy"
	)
)
hl.bind(
	mainMod .. " + semicolon",
	hl.dsp.exec_cmd('rofimoji --selector rofi --selector-args "-theme ~/.config/rofi/emoji.rasi" --action type copy')
)
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a && notify-send -i color-select 'Color Picked!'"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("~/.local/share/scripts/emulator-launcher"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("hyprctl kill"))

-- Shortcuts
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd('foot --app-id "shortcut" --title "Shortcut: htop" zsh -c "htop"'))
hl.bind(
	mainMod .. " + N",
	hl.dsp.exec_cmd('foot --app-id "shortcut" --title "Shortcut: notes" zsh -c "nvim ~/personal/notes.md"')
)
hl.bind(
	mainMod .. " + SHIFT + O",
	hl.dsp.exec_cmd(
		'foot --title "Shortcut: OpenCode VM" -e bash -c "cd ~/labs/workspace/opencode-vm && vagrant up && vagrant ssh"'
	)
)

-- Screenshots
hl.bind(
	mainMod .. " + F10",
	hl.dsp.exec_cmd(
		'mkdir -p ~/Pictures/Screenshots && grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png'
	)
)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

-- System controls
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/lockscreen"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("~/.config/hypr/scripts/powermenu"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/empty-workspace"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("networkmanager_dmenu"))

-- Media keys
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume mic-mute"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(mainMod .. " + XF86AudioNext", hl.dsp.exec_cmd("playerctl position 15+"))
hl.bind(mainMod .. " + XF86AudioPrev", hl.dsp.exec_cmd("playerctl position 15-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/hypr/scripts/volume mute"), { locked = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume up"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/volume down"),
	{ locked = true, repeating = true }
)
hl.bind(mainMod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd("amixer -D pulse sset Master 1%+"))
hl.bind(mainMod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd("amixer -D pulse sset Master 1%-"))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("~/.local/share/scripts/audio-manager toggle"))

-- Brightness controls
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness down"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness up"),
	{ locked = true, repeating = true }
)

-- Submaps
hl.bind(mainMod .. " + U", hl.dsp.submap("utilities"))
hl.define_submap("utilities", "reset", function()
	hl.bind(
		"F",
		hl.dsp.exec_cmd(
			[[pkill swaybg; swaybg -i "$(find ~/Pictures/wallpapers/current -maxdepth 1 -type f | shuf -n1)" -m fill &]]
		)
	)
	hl.bind("C", hl.dsp.exec_cmd("mate-calculator"))
	hl.bind("B", hl.dsp.exec_cmd("pkill waybar; waybar &"))
	hl.bind("A", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-animations"))
	hl.bind("return", hl.dsp.submap("reset"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(altMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("left", hl.dsp.window.resize({ x = -5, y = 0, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = 5, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = -5, relative = true }), { repeating = true })
	hl.bind("right", hl.dsp.window.resize({ x = 5, y = 0, relative = true }), { repeating = true })
	hl.bind("return", hl.dsp.submap("reset"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- VM passthrough: only this toggle is bound, every other key falls through
-- to the focused window (VM) instead of being grabbed by Hyprland.
-- Named "passthrough" so the waybar submap badge reads clearly.
hl.bind(mainMod .. " + Escape", hl.dsp.submap("passthrough"))
hl.define_submap("passthrough", function()
	hl.bind(mainMod .. " + Escape", hl.dsp.submap("reset"))
end)

-- Switch between windows in a floating workspace
hl.bind(mainMod .. " + Y", function()
	hl.dispatch(hl.dsp.window.cycle_next()) -- Change focus to another window
	hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
end)
