local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Set color scheme
config.color_scheme = "Tango"

-- Set font and font size
config.font = wezterm.font("JetBrains", { weight = "bold" })
config.font_size = 11

-- Enable the status bar
config.enable_tab_bar = false
config.use_fancy_tab_bar = false

-- Customize tab bar appearance
config.tab_max_width = 20 -- Set a maximum width for tab titles

-- Define custom key bindings
config.keys = {
	-- New Tab
	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

	-- Close Tab
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },

	-- Split Pane Horizontally
	{ key = "h", mods = "CTRL", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Split Pane Vertically
	{ key = "s", mods = "CTRL", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Copy and Paste
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

	-- Reload Configuration
	{ key = "r", mods = "CTRL|SHIFT", action = wezterm.action.ReloadConfiguration },
}

return config
