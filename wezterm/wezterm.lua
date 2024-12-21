local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("toggle-dark-light-theme", function(window, _)
	local current_scheme = window:effective_config().color_scheme

	if not current_scheme:find("Gogh") then
		wezterm.log_warn("toggle-dark-light-theme: Different color scheme than Gogh is in use")
		return
	end

	local overrides = window:get_config_overrides() or {}

	if current_scheme:find("Gruvbox Dark") then
		overrides.color_scheme = "Gruvbox (Gogh)"
	else
		overrides.color_scheme = "Gruvbox Dark (Gogh)"
	end

	window:set_config_overrides(overrides)
end)

-- Spawn a tab with setting the light env variable on on light themes, which will be read by fish shell to set its theme accordingly
wezterm.on("spawn_tab_according_to_theme", function(window, pane)
	local current_scheme = window:effective_config().color_scheme

	if current_scheme == "Gruvbox (Gogh)" then
		window:perform_action(
			act.SpawnCommandInNewTab({
				args = { "fish" },
				set_environment_variables = {
					-- Fish well check for this variable and apply its light theme colors
					WEZ_LIGHT_THEME = "1",
				},
			}),
			pane
		)
	else
		window:perform_action(act.SpawnTab("CurrentPaneDomain"), pane)
	end
end)

-- Spawn a window with setting the light env variable on on light themes, which will be read by fish shell to set its theme accordingly
wezterm.on("spawn_win_according_to_theme", function(window, pane)
	local current_scheme = window:effective_config().color_scheme

	if current_scheme == "Gruvbox (Gogh)" then
		local _, _, mux_win = wezterm.mux.spawn_window({
			args = { "fish" },
			set_environment_variables = {
				-- Fish well check for this variable and apply its light theme colors
				WEZ_LIGHT_THEME = "1",
			},
		})

		local new_win = mux_win:gui_window()
		new_win:set_config_overrides({ color_scheme = "Gruvbox (Gogh)" })
	else
		window:perform_action(act.SpawnWindow, pane)
	end
end)

return {
	default_prog = { "/usr/bin/fish" },
	-- color_scheme = "Gruvbox (Gogh)", -- Light theme
	-- color_scheme = "Gruvbox Material (Gogh)",
	-- color_scheme = "Gruvbox Dark (Gogh)",
	-- color_scheme = "GruvboxDarkHard",
	color_scheme = "Gruvbox dark, hard (base16)",
	window_background_opacity = 0.95,
	window_decorations = "RESIZE",
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	enable_scroll_bar = false,
	window_close_confirmation = "AlwaysPrompt",
	enable_wayland = true,
	force_reverse_video_cursor = true,
	initial_cols = 110,
	initial_rows = 45,
	show_new_tab_button_in_tab_bar = false,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	term = "wezterm",
	integrated_title_buttons = { "Maximize", "Close" },
	warn_about_missing_glyphs = false,
	window_padding = { bottom = 2, top = 5, left = 5, right = 2 },

	-- TODO: Check if disabling hinting has an impact on the performance
	-- freetype_load_target = "Light",
	-- freetype_load_flags = "NO_HINTING",
	-- freetype_load_flags = "NO_AUTOHINT",
	-- freetype_load_flags = "FORCE_AUTOHINT",

	-- front_end = "OpenGL",
	-- front_end = "WebGpu",
	-- webgpu_power_preference = "HighPerformance",

	-- font = wezterm.font("Monaco"),
	-- font = wezterm.font("fira code", { weight = "Medium" }),
	-- font = wezterm.font("fira code"),
	font = wezterm.font_with_fallback({
		"fira code Medium",
		{ family = "Symbols Nerd Font Mono Regular", scale = 0.85 },
	}),
	-- font = wezterm.font("Sf mono"),
	-- font = wezterm.font("roboto mono"),
	-- font = wezterm.font("JetBrains mono", { weight = "Medium" }),
	-- font = wezterm.font("DejaVu sans mono"),
	font_size = 13,
	-- font_size = 12.7,
	-- line_height = 1.05,
	default_cursor_style = "SteadyBlock",
	-- TODO: Check the best fps for my computer
	-- max_fps = 30,

	-- webgpu_preferred_adapter = {
	-- 	backend = "Vulkan",
	-- 	device = 16032,
	-- 	device_type = "IntegratedGpu",
	-- 	driver = "Intel open-source Mesa driver",
	-- 	driver_info = "Mesa 23.1.8",
	-- 	name = "Intel(R) UHD Graphics 620 (WHL GT2)",
	-- 	vendor = 32902,
	-- },
	--
	-- This rules only applies when using FiraCode
	font_rules = {
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font({
				family = "FiraCode",
				weight = "DemiBold",
			}),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font({
				family = "FiraCode",
				weight = "DemiBold",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({
				family = "FiraCode",
				weight = "DemiBold",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({
				family = "FiraCode",
				weight = "Medium",
				style = "Italic",
			}),
		},
	},

	disable_default_key_bindings = true,
	keys = {
		-- Panes
		{ key = '"', mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = '"', mods = "SHIFT|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "SHIFT|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

		{ key = "_", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "_", mods = "SHIFT|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- Taps
		{ key = "T", mods = "ALT", action = act.EmitEvent("spawn_tab_according_to_theme") },
		{ key = "T", mods = "SHIFT|ALT", action = act.EmitEvent("spawn_tab_according_to_theme") },
		{ key = "Enter", mods = "SHIFT|ALT", action = act.EmitEvent("spawn_win_according_to_theme") },
		{ key = "y", mods = "SHIFT|ALT", action = act.EmitEvent("spawn_tab_according_to_theme") },
		{ key = "Y", mods = "SHIFT|ALT", action = act.EmitEvent("spawn_tab_according_to_theme") },

		{ key = "p", mods = "SHIFT|ALT", action = act.ActivateTabRelative(1) },
		{ key = "P", mods = "SHIFT|ALT", action = act.ActivateTabRelative(1) },
		{ key = "n", mods = "SHIFT|ALT", action = act.ActivateTabRelative(-1) },
		{ key = "N", mods = "SHIFT|ALT", action = act.ActivateTabRelative(-1) },

		{ key = "1", mods = "ALT", action = act.ActivateTab(0) },
		{ key = "2", mods = "ALT", action = act.ActivateTab(1) },
		{ key = "3", mods = "ALT", action = act.ActivateTab(2) },
		{ key = "4", mods = "ALT", action = act.ActivateTab(3) },
		{ key = "5", mods = "ALT", action = act.ActivateTab(4) },
		{ key = "6", mods = "ALT", action = act.ActivateTab(5) },

		{ key = "q", mods = "ALT", action = act.ActivateLastTab },
		{ key = "Space", mods = "SHIFT|ALT", action = act.ActivateLastTab },
		{ key = "i", mods = "SHIFT|ALT", action = act.ActivateLastTab },

		-- Font size
		{ key = ")", mods = "CTRL", action = act.ResetFontSize },
		{ key = ")", mods = "SHIFT|CTRL", action = act.ResetFontSize },
		{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
		{ key = "_", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },

		-- Clipboard
		{ key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
		{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "C", mods = "SHIFT|ALT", action = act.CopyTo("Clipboard") },

		{ key = "F", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "F", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "F", mods = "SHIFT|ALT", action = act.Search("CurrentSelectionOrEmptyString") },

		{ key = "L", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
		{ key = "N", mods = "CTRL", action = act.SpawnWindow },
		{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
		{ key = "P", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },

		{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "V", mods = "SHIFT|ALT", action = act.PasteFrom("Clipboard") },

		{ key = "W", mods = "ALT", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "W", mods = "SHIFT|ALT", action = act.CloseCurrentTab({ confirm = true }) },

		{ key = "?", mods = "ALT", action = act.ActivateCopyMode },
		{ key = "?", mods = "SHIFT|ALT", action = act.ActivateCopyMode },

		{ key = "M", mods = "ALT", action = act.TogglePaneZoomState },
		{ key = "M", mods = "SHIFT|ALT", action = act.TogglePaneZoomState },

		{ key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },

		{ key = "UpArrow", mods = "SHIFT|ALT", action = act.ScrollByPage(-1) },
		{ key = "UpArrow", mods = "ALT", action = act.ScrollByPage(-1) },
		{ key = "DownArrow", mods = "SHIFT|ALT", action = act.ScrollByPage(1) },
		{ key = "DownArrow", mods = "ALT", action = act.ScrollByPage(1) },

		{ key = "<", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
		{ key = ">", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },

		{ key = "H", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Left") },
		{ key = "L", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Right") },
		{ key = "K", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Up") },
		{ key = "J", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Down") },
		{ key = "{", mods = "SHIFT|ALT", action = act.RotatePanes("Clockwise") },
		{ key = "B", mods = "SHIFT|ALT", action = act.EmitEvent("toggle-dark-light-theme") },

		{ key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },
		{ key = "Insert", mods = "CTRL", action = act.CopyTo("PrimarySelection") },
		{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
		{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
	},

	key_tables = {
		copy_mode = {
			{ key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "Tab", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "Space", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = ",", mods = "NONE", action = act.CopyMode("JumpReverse") },
			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
			{ key = "F", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
			{ key = "F", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
			{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
			{ key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "T", mods = "NONE", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "T", mods = "SHIFT", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "d", mods = "CTRL", action = act.CopyMode({ MoveByPage = 0.5 }) },
			{ key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },
			{ key = "f", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
			{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
			{ key = "g", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "t", mods = "NONE", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
			{ key = "u", mods = "CTRL", action = act.CopyMode({ MoveByPage = -0.5 }) },
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{
				key = "y",
				mods = "NONE",
				action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
			},
			{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
			{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },
			{ key = "End", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "Home", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "LeftArrow", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },
			{ key = "RightArrow", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
		},

		search_mode = {
			{ key = "Enter", mods = "NONE", action = act.CopyMode("PriorMatch") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
			{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
			{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
			{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
			{ key = "w", mods = "CTRL", action = act.CopyMode("ClearPattern") },
			{ key = "UpArrow", mods = "NONE", action = act.CopyMode("PriorMatch") },
			{ key = "DownArrow", mods = "NONE", action = act.CopyMode("NextMatch") },
		},
	},
}
