local wezterm = require("wezterm")
local mux = wezterm.mux

local cache_dir = os.getenv('HOME') .. '/.cache/wezterm/'
local window_size_cache_path = cache_dir .. 'window_size_cache.txt'

wezterm.on('gui-startup', function()
    os.execute('mkdir ' .. cache_dir)

    local window_size_cache_file = io.open(window_size_cache_path, 'r')
    if window_size_cache_file ~= nil then
        _, _, width, height = string.find(window_size_cache_file:read(), '(%d+),(%d+)')
        mux.spawn_window { width = tonumber(width), height = tonumber(height) }
        window_size_cache_file:close()
    else
        local tab, pane, window = mux.spawn_window {}
    end
end)

wezterm.on('window-resized', function(window, pane)
    local window_size_cache_file = io.open(window_size_cache_path, 'r')
    if window_size_cache_file ~= nil then
        local tab_size = pane:tab():get_size()
        cols = tab_size['cols']
        rows = tab_size['rows'] + 2 -- Without adding the 2 here, the window doesn't maximize
        contents = string.format('%d,%d', cols, rows)
        window_size_cache_file = assert(io.open(window_size_cache_path, 'w'))
        window_size_cache_file:write(contents)
        window_size_cache_file:close()
    end
end)

local config = wezterm.config_builder()

-- Add configurations here
config.font = wezterm.font("JetBrainsMono Nerd Font")

config.keys = {
    { key = "d",          mods = "SUPER",       action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "d",          mods = "SUPER|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "w",          mods = "SUPER",       action = wezterm.action.CloseCurrentPane({ confirm = true }) },
    { key = "LeftArrow",  mods = "SUPER|ALT",   action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "SUPER|ALT",   action = wezterm.action.ActivatePaneDirection("Right") },
    { key = "UpArrow",    mods = "SUPER|ALT",   action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "DownArrow",  mods = "SUPER|ALT",   action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "LeftArrow",  mods = "SUPER|ALT",   action = wezterm.action.AdjustPaneSize({ "Left", 3 }) },
    { key = "RightArrow", mods = "SUPER|ALT",   action = wezterm.action.AdjustPaneSize({ "Right", 3 }) },
    { key = "UpArrow",    mods = "SUPER|ALT",   action = wezterm.action.AdjustPaneSize({ "Up", 3 }) },
    { key = "DownArrow",  mods = "SUPER|ALT",   action = wezterm.action.AdjustPaneSize({ "Down", 3 }) },
    { key = "LeftArrow",  mods = "OPT",         action = wezterm.action.SendString("\x1bb") },
    { key = "RightArrow", mods = "OPT",         action = wezterm.action.SendString("\x1bf") },
}

return config
