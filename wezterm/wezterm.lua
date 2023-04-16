local wezterm = require("wezterm")

return {
	default_prog = { "/usr/bin/fish" },
	color_scheme = "Catppuccin Mocha",
	window_background_opacity = 0.93,
	window_decorations = "NONE",
	enable_tab_bar = false,
	enable_scroll_bar = false,
	window_close_confirmation = "NeverPrompt",

	-- font = wezterm.font("Monaco"),
	-- font = wezterm.font("fira code"),
	-- font = wezterm.font("Sf mono"),
	-- font = wezterm.font("roboto mono"),
	-- font = wezterm.font("JetBrains mono"),
	-- font = wezterm.font("DejaVu sans mono"),
}
