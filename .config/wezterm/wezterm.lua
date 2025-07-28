-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

-- This is where you actually apply your config choices
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.keys = {
    {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'CTRL|SHIFT',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'CTRL|SHIFT',
        action = act.ActivatePaneDirection 'Down',
    },
    {
        key = "n",
        mods = "CMD",
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'n',
        mods = 'CTRL',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'w',
        mods = 'CMD',
        action = act.CloseCurrentPane { confirm = true },
    }
}

-- and finally, return the configuration to wezterm
return config
