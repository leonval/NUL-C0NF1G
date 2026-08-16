-- Map Leader Key
local wezterm = require("wezterm")
local action = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.leader = { mods = "CTRL", key = "a", timeout_milliseconds = 500 }

	-- Keybinding
	config.keys = {
		-- Tab Navigation
		{
			mods = "CTRL",
			key = "t",
			action = action.SpawnTab("CurrentPaneDomain"),
		},
		{
			mods = "CTRL",
			key = "w",
			action = action.CloseCurrentPane({ confirm = true }),
		},
		{
			mods = "LEADER",
			key = "h",
			action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "v",
			action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "CTRL",
			key = "h",
			action = action.ActivatePaneDirection("Left"),
		},
		{
			mods = "CTRL",
			key = "j",
			action = action.ActivatePaneDirection("Down"),
		},
		{
			mods = "CTRL",
			key = "k",
			action = action.ActivatePaneDirection("Up"),
		},
		{
			mods = "CTRL",
			key = "l",
			action = action.ActivatePaneDirection("Right"),
		},
		{
			mods = "CTRL|SHIFT",
			key = "!",
			action = action.MoveTab(0),
		},
		{
			mods = "CTRL|SHIFT",
			key = "@",
			action = action.MoveTab(1),
		},
		{
			mods = "CTRL|SHIFT",
			key = "#",
			action = action.MoveTab(2),
		},
		{
			mods = "CTRL|SHIFT",
			key = "$",
			action = action.MoveTab(3),
		},
		{
			mods = "CTRL|SHIFT",
			key = "%",
			action = action.MoveTab(4),
		},
		{
			mods = "CTRL|SHIFT",
			key = "^",
			action = action.MoveTab(5),
		},
		-- Text Navigation
		{
			key = "Home",
			action = action.SendString("\x01"),
		},
		{
			key = "End",
			action = action.SendString("\x05"),
		},
		{
			mods = "CTRL",
			key = "LeftArrow",
			action = action.SendString("\x1bb"),
		},
		{
			mods = "CTRL",
			key = "RightArrow",
			action = action.SendString("\x1bf"),
		},
		-- Launcher
		{
			mods = "CTRL",
			key = "p",
			action = action.ShowLauncher,
		},
	}

	-- Activate tab 1-9 with Ctrl+1-9
	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "CTRL",
			action = action.ActivateTab(i - 1),
		})
	end
end

return M
