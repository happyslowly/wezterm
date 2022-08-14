local wezterm = require("wezterm")

local M = {}

M.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
M.keys = {
    { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("DefaultDomain") },
    { key = "1", mods = "LEADER", action = wezterm.action.ActivateTab(0) },
    { key = "2", mods = "LEADER", action = wezterm.action.ActivateTab(1) },
    { key = "3", mods = "LEADER", action = wezterm.action.ActivateTab(2) },
    { key = "4", mods = "LEADER", action = wezterm.action.ActivateTab(3) },
    { key = "5", mods = "LEADER", action = wezterm.action.ActivateTab(4) },
    { key = "6", mods = "LEADER", action = wezterm.action.ActivateTab(5) },
    { key = "7", mods = "LEADER", action = wezterm.action.ActivateTab(6) },
    { key = "8", mods = "LEADER", action = wezterm.action.ActivateTab(7) },
    { key = "9", mods = "LEADER", action = wezterm.action.ActivateTab(-1) },
    { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
    { key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
    { key = "q", mods = "LEADER", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
}

return M
