-- Keymapping for wezterm to act like tmux
local wezterm = require 'wezterm'
local keymap = {}

keymap.tmux = {
	-- vsplit, hsplit
	{
		key = '\\',
		mods = 'LEADER',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	}, 
	{
		key = '-',
		mods = 'LEADER',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	}, 
	{
		key = '%',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	}, 
	{
		key = '\"',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	}, 
	-- Pane actions 
	{
		key = 'c',
		mods = 'LEADER',
		action = wezterm.action.SpawnTab "CurrentPaneDomain",
	},
	{
		key = '&',
		mods = 'LEADER|SHIFT',
		action = wezterm.action.CloseCurrentTab { confirm = true },
	},
	{
		key = 'x',
		mods = 'LEADER',
		action = wezterm.action.CloseCurrentPane{ confirm = true },
	},
	
	-- Pane navigation
	{ 
		key = 'UpArrow',
		mods = 'LEADER',
		action = wezterm.action.ActivatePaneDirection "Up",
	},
	{ 
		key = 'DownArrow',
		mods = 'LEADER',
		action = wezterm.action.ActivatePaneDirection "Down",
	},
	{ 
		key = 'RightArrow',
		mods = 'LEADER',
		action = wezterm.action.ActivatePaneDirection "Right",
	},
	{ 
		key = 'LeftArrow',
		mods = 'LEADER',
		action = wezterm.action.ActivatePaneDirection "Left",
	},

	{ 
		key = '1',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(0),
	},
	{ 
		key = '2',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(1),
	},
	{ 
		key = '3',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(2),
	},
	{ 
		key = '4',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(3),
	},
	{ 
		key = '5',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(4),
	},
	{ 
		key = '6',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(5),
	},
	{ 
		key = '7',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(6),
	},
	{ 
		key = '8',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(7),
	},
	{ 
		key = '9',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(8),
	},
	{ 
		key = '0',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(9),
	},
	-- Send ctrl-a when leader pressed twice
	{
		key = 'a',
		mods = 'LEADER|CTRL',
		action = wezterm.action.SendString '\x01',
	},
}

return keymap
