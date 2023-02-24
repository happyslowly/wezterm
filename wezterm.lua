local fonts = require("fonts")
local tabbar = require("tabbar")
local keys = require("keys")

local function shallow_merge(result, ...)
  for _, t in pairs({ ... }) do
    for k, v in pairs(t) do
      result[k] = v
    end
  end
  return result
end

M = {
  scrollback_lines = 10000,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
  tab_max_width = 48,
  color_scheme = "tokyonight-storm",
  audible_bell = "Disabled",
}

return shallow_merge(M, fonts, keys, tabbar)
