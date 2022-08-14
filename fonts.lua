local wezterm = require("wezterm")

local M = {}

local family = "Cascadia Code"
local fallback_family = "CaskaydiaCove Nerd Font Mono"

local function font_with_fallback(name, params)
    local names = { name, fallback_family }
    return wezterm.font_with_fallback(names, params)
end

M.font = font_with_fallback(family, { weight = "DemiLight" })
M.font_size = 18.0
M.font_rules = {
    {
        italic = true,
        font = font_with_fallback(family, { weight = "DemiLight", italic = true }),
    },
    {
        italic = true,
        intensity = "Bold",
        font = font_with_fallback(family, { weight = "Regular", italic = true }),
    },
    {
        intensity = "Bold",
        font = font_with_fallback(family, { weight = "Regular" }),
    },
}

return M
