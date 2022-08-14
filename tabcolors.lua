local wezterm = require("wezterm")

local M = {}

local color_scheme = "tokyonight-storm"
local scheme = wezterm.get_builtin_color_schemes()[color_scheme]

local active_bg = scheme.brights[4]
local active_fg = scheme.ansi[1]
local inactive_bg = scheme.background
local inactive_fg = scheme.ansi[8]

scheme.tab_bar = {
    background = scheme.background,
    new_tab = {
        bg_color = active_bg,
        fg_color = active_fg,
    },
    active_tab = {
        bg_color = active_bg,
        fg_color = active_fg,
    },
    inactive_tab = {
        bg_color = inactive_bg,
        fg_color = inactive_fg,
    },
    inactive_tab_hover = {
        bg_color = active_bg,
        fg_color = active_fg,
    },
}

local function get_title(tab, tabs, panes, config, hover, max_width)
    local title = " " .. (tab.tab_index + 1) .. ": " .. tab.active_pane.title .. " "
    if #title <= max_width then
        return title
    end
    local ellipsis = "..."
    return wezterm.truncate_right(title, max_width - (2 + #ellipsis)) .. ellipsis
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local title = get_title(tab, tabs, panes, config, hover, max_width)

    if tab.is_active then
        return {
            { Attribute = { Intensity = "Bold" } },
            { Text = title },
            { Background = { Color = "#000000" } },
            { Text = " " },
        }
    end
    return {
        { Text = title },
        { Background = { Color = "#000000" } },
        { Text = " " },
    }
end)

M.color_schemes = { [color_scheme] = scheme }
M.color_scheme = color_scheme

return M
