local wezterm = require("wezterm")

local M = {}

local family = "JetBrains Mono"
local fallback_family = "JetBrainsMono Nerd Font"

local function font_with_fallback(name, params)
    local names = { name, fallback_family }
    return wezterm.font_with_fallback(names, params)
end

wezterm.on("toggle-ligature", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.harfbuzz_features then
        -- If we haven't overridden it yet, then override with ligatures disabled
        overrides.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
    else
        -- else we did already, and we should disable out override now
        overrides.harfbuzz_features = nil
    end
    window:set_config_overrides(overrides)
end)

M.font = font_with_fallback(family, { weight = "Regular" })
M.font_size = 20.0
M.font_rules = {
    {
        italic = true,
        font = font_with_fallback(family, { weight = "Regular", italic = true }),
    },
    {
        italic = true,
        intensity = "Bold",
        font = font_with_fallback(family, { weight = "Bold", italic = true }),
    },
    {
        intensity = "Bold",
        font = font_with_fallback(family, { weight = "Bold" }),
    },
}

return M
