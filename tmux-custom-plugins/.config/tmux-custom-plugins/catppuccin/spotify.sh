show_spotify() { # This function name must match the module name!
	local index icon color text module

	index=$1

	icon="$(get_tmux_option "@catppuccin_spotify_icon" "")"
	color="$(get_tmux_option "@catppuccin_spotify_color" "#1DB954")"
	text="$(get_tmux_option "@catppuccin_spotify_text" "#(~/.config/polybar/scripts/get_spotify_status.sh)")"

	module=$(build_status_module "$index" "$icon" "$color" "$text")

	echo "$module"
}
