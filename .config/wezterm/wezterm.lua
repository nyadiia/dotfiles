local wezterm = require 'wezterm'

function scheme_for_appearance(appearance)
	if appearance:find "light" then
		return "Catppuccin Latte"
	else
		return "Catppuccin Mocha"
	end
	print 'wezterm.gui.get_appearance()'
end

return {
  font = wezterm.font 'JetbrainsMono Nerd Font',
  font_size = 14,
	window_background_opacity = 0.8,
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	colors = {
		background = '#11111b'
	},
  enable_tab_bar = false,
  window_padding = {
    left = 1,
    right = 1
  },
  window_close_confirmation = 'NeverPrompt'

}
