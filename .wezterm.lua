local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Add configurations here
config.font = wezterm.font("JetBrainsMono Nerd Font")

config.keys = {
	{ key = "d", mods = "SUPER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "SUPER|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "LeftArrow", mods = "SUPER|ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "SUPER|ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "SUPER|ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "SUPER|ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "SUPER|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 3 }) },
	{ key = "RightArrow", mods = "SUPER|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 3 }) },
	{ key = "UpArrow", mods = "SUPER|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 3 }) },
	{ key = "DownArrow", mods = "SUPER|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 3 }) },
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString("\x1bb") },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\x1bf") },
}

return config
