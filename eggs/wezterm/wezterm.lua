-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Config
config.allow_win32_input_mode = false
config.color_scheme = "tokyonight_night"
config.colors = { background = "#000000" } -- {< replace_color(palette.hex.black) >}
-- {% if SYSTEM.platform == "Windows" %}
--<yolk> config.default_prog = { "nu" }
-- {% else %}
config.default_prog = { "zsh" }
-- {% end %}
config.font = wezterm.font_with_fallback({ '0xProto Nerd Font', "Cascadia Code", "JetBrains Mono" }) -- {< replace_in(`'`, font) >}
--<yolk> config.window_decorations = "RESIZE" -- {< if SYSTEM.platform == "Windows" >}
config.window_background_opacity = 0.85
config.inactive_pane_hsb = {
	brightness = 0.4,
}

-- Fullscreen
--[[ wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)
--]]

-- Map Leader Key
config.leader = { mods = "CTRL", key = "a", timeout_milliseconds = 500 }

local action = wezterm.action

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
		action = action.SendString '\x01',
	},
	{
		key = "End",
		action = action.SendString '\x05',
	},
	{
		mods = "CTRL",
		key = "LeftArrow",
		action = action.SendString '\x1bb',
	},
	{
		mods = "CTRL",
		key = "RightArrow",
		action = action.SendString '\x1bf',
	},
	-- Launcher
	{
		mods = "CTRL",
		key = "Space",
		action = action.ShowLauncher,
	}
}

-- Activate tab 1-9 with Ctrl+1-9
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = action.ActivateTab(i - 1),
	})
end

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Tmux Status
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
