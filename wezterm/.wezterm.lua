local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- appearance
local triplea = require("lua/triplea")
config.colors = triplea.triplea.colors()
config.window_frame = triplea.triplea.window_frame()
config.font = wezterm.font_with_fallback({ "Agave Nerd Font" })
config.font_size = 16.0
config.line_height = 1.2
config.warn_about_missing_glyphs = false

-- window settings
--  on linux compositor handles this.
-- config.window_background_opacity = 0.95
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 0,
}

-- tab bar settings
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false

-- tab title format
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.tab_title
	if title and #title > 0 then
		return " " .. title .. " "
	end
	return " " .. tab.active_pane.title .. " "
end)

-- leader key (ctrl+s prefix)
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }

-- keybindings
config.keys = {
	-- split panes with prefix
	{ key = "o", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "e", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- navigate panes with alt+arrow
	{ key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },

	-- resize panes with ctrl+shift+arrow
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },

	-- navigate tabs with shift+arrow
	{ key = "LeftArrow", mods = "SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "SHIFT", action = act.ActivateTabRelative(1) },

	-- new tab with prefix
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

	-- new tab (simple)
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

	-- new tab with name
	{
		key = "N",
		mods = "LEADER|SHIFT",
		action = act.PromptInputLine({
			description = "New tab name:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					local tab = window:mux_window():spawn_tab({})
					tab:set_title(line)
				end
			end),
		}),
	},

	-- copy mode
	{ key = "a", mods = "LEADER", action = act.ActivateCopyMode },

	-- reload config
	{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },

	-- toggle tab bar
	{
		key = "b",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			local overrides = window:get_config_overrides() or {}
			overrides.enable_tab_bar = not overrides.enable_tab_bar
			window:set_config_overrides(overrides)
		end),
	},

	-- close pane
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	-- zoom pane
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = "w",
		mods = "LEADER",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},

	-- new workspace with name
	{
		key = "S",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "New workspace name:",
			action = wezterm.action_callback(function(window, pane, line)
				if not line or line == "" then
					return
				end

				window:perform_action(
					act.SwitchToWorkspace({
						name = line,
					}),
					pane
				)
			end),
		}),
	},
}

-- other settings
config.scrollback_lines = 10000

return config
