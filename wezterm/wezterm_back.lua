local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { "/usr/bin/fish" }
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.window_close_confirmation = "NeverPrompt"
config.enable_wayland = true
config.force_reverse_video_cursor = true
config.initial_cols = 110
config.initial_rows = 45
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.term = "wezterm"
config.integrated_title_buttons = { "Maximize", "Close" }

-- config.freetype_load_flags = "NO_HINTING",

-- config.font = wezterm.font("Monaco")
-- config.font = wezterm.font("fira code", { weight = "Medium" })
-- config.font = wezterm.font("fira code")
config.font = wezterm.font("fira code Retina")
-- config.font = wezterm.font("Sf mono")
-- config.font = wezterm.font("roboto mono")
-- config.font = wezterm.font("JetBrains mono", { weight = "Medium" })
-- config.font = wezterm.font("DejaVu sans mono")
config.font_size = 12.7
config.line_height = 1.05
config.default_cursor_style = "SteadyBlock"
-- TODO: Check the best fps for my computer
config.max_fps = 30

-- This rules only applies when using FiraCode
config.font_rules = {
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
}

config.disable_default_key_bindings = true

config.keys = {
	-- Panes
	{ key = '"', mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "SHIFT|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "SHIFT|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	{ key = "_", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "_", mods = "SHIFT|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Taps
	{ key = "T", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "T", mods = "SHIFT|ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "Enter", mods = "SHIFT|ALT", action = act.SpawnTab("CurrentPaneDomain") },

	{ key = "n", mods = "SHIFT|ALT", action = act.ActivateTabRelative(1) },
	{ key = "N", mods = "SHIFT|ALT", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "SHIFT|ALT", action = act.ActivateTabRelative(-1) },
	{ key = "P", mods = "SHIFT|ALT", action = act.ActivateTabRelative(-1) },

	{ key = "!", mods = "ALT", action = act.ActivateTab(0) },
	{ key = "!", mods = "SHIFT|ALT", action = act.ActivateTab(0) },
	{ key = "@", mods = "ALT", action = act.ActivateTab(1) },
	{ key = "@", mods = "SHIFT|ALT", action = act.ActivateTab(1) },
	{ key = "#", mods = "ALT", action = act.ActivateTab(2) },
	{ key = "#", mods = "SHIFT|ALT", action = act.ActivateTab(2) },
	{ key = "$", mods = "ALT", action = act.ActivateTab(3) },
	{ key = "$", mods = "SHIFT|ALT", action = act.ActivateTab(3) },
	{ key = "%", mods = "ALT", action = act.ActivateTab(4) },
	{ key = "%", mods = "SHIFT|ALT", action = act.ActivateTab(4) },
	{ key = "^", mods = "ALT", action = act.ActivateTab(5) },
	{ key = "^", mods = "SHIFT|ALT", action = act.ActivateTab(5) },

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

	-- I close tab by mistake like that
	-- { key = "W", mods = "ALT", action = act.CloseCurrentTab({ confirm = true }) },
	-- { key = "W", mods = "SHIFT|ALT", action = act.CloseCurrentTab({ confirm = true }) },

	{ key = "?", mods = "ALT", action = act.ActivateCopyMode },
	{ key = "?", mods = "SHIFT|ALT", action = act.ActivateCopyMode },

	{ key = "M", mods = "ALT", action = act.TogglePaneZoomState },
	{ key = "M", mods = "SHIFT|ALT", action = act.TogglePaneZoomState },

	{ key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },

	{ key = "}", mods = "ALT", action = act.ScrollByPage(-1) },
	{ key = "}", mods = "SHIFT|ALT", action = act.ScrollByPage(-1) },
	{ key = "{", mods = "ALT", action = act.ScrollByPage(1) },
	{ key = "{", mods = "SHIFT|ALT", action = act.ScrollByPage(1) },

	{ key = "<", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
	{ key = ">", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },

	{ key = "H", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "L", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "K", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "J", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Down") },

	{ key = "LeftArrow", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Down", 1 }) },

	{ key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },
	{ key = "Insert", mods = "CTRL", action = act.CopyTo("PrimarySelection") },
	{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
	{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
}

config.key_tables = {
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
}

return config
