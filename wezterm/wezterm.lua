local wezterm = require 'wezterm'
local keymap = require 'keymap'
local config = {}

-- Functions
function get_system_theme()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return 'Dark'
end

function scheme_for_theme_solar(theme)
	if theme:find 'Dark' then
		return 'Builtin Solarized Dark'
	else
		return 'Builtin Solarized Light'
	end
end

function scheme_for_theme_gruv(theme)
	if theme:find 'Dark' then
		return 'Gruvbox dark, medium (base16)'
	else
		return 'Gruvbox light, medium (base16)'
	end
end

-- General
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_domain = 'WSL:Ubuntu'
end

-- Keybindings
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = keymap.tmux

-- Appearance
if wezterm.target_triple == "x86_64-apple-darwin" then
    config.color_scheme = 'Gruvbox dark, medium (base16)'
    config.font = wezterm.font 'MesloLGS Nerd Font Mono'
    config.font_size = 12
    config.underline_position = '110%'
else
    config.color_scheme = scheme_for_theme_solar(get_system_theme())
    config.font = wezterm.font 'Meslo LG S'
    config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
    config.font_size = 11
end

return config
