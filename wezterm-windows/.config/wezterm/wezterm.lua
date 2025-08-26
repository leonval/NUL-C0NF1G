-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Config
config.allow_win32_input_mode = false
config.color_scheme = "tokyonight_night"
config.colors = { background = "black" }
config.default_prog = { "pwsh.exe" }
config.font = wezterm.font_with_fallback({ "Cascadia Code", "JetBrains Mono" })
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75

-- Fullscreen
--[[ wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)
--]]

-- Map Leader Key
-- config.leader = { mods = "CTRL", key = "Space", timeout_milliseconds = 500 }

-- tmux
config.keys = {
	{
		mods = "CTRL",
		key = "t",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "CTRL",
		key = "w",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		mods = "CTRL",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "CTRL",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "CTRL",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "CTRL",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "CTRL",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "CTRL",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "CTRL",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "CTRL",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "CTRL",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "CTRL",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		mods = "CTRL",
		key = "p",
		action = wezterm.action.ShowLauncher,
	},
	{
		mods = "CTRL|SHIFT",
		key = "!",
		action = wezterm.action.MoveTab(0),
	},
	{
		mods = "CTRL|SHIFT",
		key = "@",
		action = wezterm.action.MoveTab(1),
	},
	{
		mods = "CTRL|SHIFT",
		key = "#",
		action = wezterm.action.MoveTab(2),
	},
	{
		mods = "CTRL|SHIFT",
		key = "$",
		action = wezterm.action.MoveTab(3),
	},
	{
		mods = "CTRL|SHIFT",
		key = "%",
		action = wezterm.action.MoveTab(4),
	},
	{
		mods = "CTRL|SHIFT",
		key = "^",
		action = wezterm.action.MoveTab(5),
	},
}

for i = 0, 8 do
	-- ctrl + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i + 1),
		mods = "CTRL",
		action = wezterm.action.ActivateTab(i),
	})
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#333333" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x5350) -- Swastika symbol 😋
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#04ff04" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#101010" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

-- and finally, return the configuration to wezterm
return config
