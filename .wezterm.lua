local wezterm = require 'wezterm';

return {
  --font = wezterm.font("Fira Code"),
  font = wezterm.font("JetBrainsMono Nerd Font Mono"),
  color_scheme = "Pandora",
  --color_scheme = "Purple Rain",
  --color_scheme = "Solarized Dark Higher Contrast",
  --color_scheme = "Spacedust",
  --color_scheme = "ToyChest",
  --color_scheme = "Vaughn",
  exit_behavior = "Close",
  keys = {
    -- This will create a new split and run your default program inside it
    {key="6", mods="CTRL",action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="8", mods="CTRL",action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  }
}
