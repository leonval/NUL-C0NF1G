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

-- Status & Vi Mode Indicator (Both on the Left)
wezterm.on("update-right-status", function(window, pane)
    local vi_mode = pane:get_user_vars().VI_MODE or "INSERT"

    local mode_text = ""
    local mode_background = "#333333"
    local mode_foreground = "#000000"

    if vi_mode == "NORMAL" then
	mode_text = " NORMAL "
	mode_foreground = "#04ff04" -- {< replace_color(palette.hex.neonGreen) >}
	mode_background = "#000000" -- {< replace_color(palette.hex.black) >}
    elseif vi_mode == "INSERT" then
	mode_text = " INSERT "
	mode_foreground = "#000000" -- {< replace_color(palette.hex.black) >}
	mode_background = "#04ff04" -- {< replace_color(palette.hex.neonGreen) >}
    end

    local leader_prefix = ""
    if window:leader_is_active() then
	leader_prefix = " " .. 'LEADER' .. " " -- Leader active icon
    end

    -- Render BOTH on the left status
    window:set_left_status(wezterm.format({
	{ Background = { Color = mode_background } },
	{ Foreground = { Color = mode_foreground } },
	{ Attribute = { Intensity = "Bold" } },
	{ Text = mode_text },
	{ Background = { Color = "#000000" } }, -- {< replace_color(palette.hex.black) >}
	{ Foreground = { Color = "#f38ba8" } }, -- {< replace_color(palette.hex.danger) >}
	{ Text = leader_prefix },
    }))
end)

-- and finally, return the configuration to wezterm
return config
