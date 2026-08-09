-- https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Some services (XDG Desktop Portal, XDPH) refuse to start without
-- graphical-session.target. Starts/stops hyprland-session.target
-- (BindsTo in ~/.config/systemd/user/hyprland-session.target).
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
end)

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")

	hl.exec_cmd("/usr/bin/lxpolkit")
	hl.exec_cmd("copyq --start-server")
	hl.exec_cmd("mako")
	hl.exec_cmd([[rm -f "$WOBSOCK"; mkfifo -m 600 "$WOBSOCK"; tail -f "$WOBSOCK" | wob]])
	hl.exec_cmd("sleep 3 && ~/.config/hypr/scripts/idle-manager")

	hl.exec_cmd([[swaybg -i "$(find ~/Pictures/wallpapers/current -maxdepth 1 -type f | shuf -n1)" -m fill]])
	hl.exec_cmd("sleep 1 && ~/.config/hypr/scripts/start-waybar")
end)
