local wezterm = require 'wezterm'

M = {}
M.window_frame = {
  font = wezterm.font { family = 'Noto Sans Mono', weight = 'Medium' },
  font_size = 12.0,
  inactive_titlebar_bg = '#24283b',
  active_titlebar_bg = '#24283b',
  button_bg = '#24283b',
}

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    if tab.is_active then
      return {
        { Background = { Color = '#24283b' } },
        { Foreground = { Color = '#a9b1d6' } },
        { Text = ' ' .. (tab.tab_index + 1) .. ': ' .. tab.active_pane.title .. ' ' },
      }
    else
      return {
        { Background = { Color = '#1a1b26' } },
        { Text = ' ' .. (tab.tab_index + 1) .. ': ' .. tab.active_pane.title .. ' ' },
      }
    end
  end
)

return M
