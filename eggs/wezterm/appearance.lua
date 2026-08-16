local wezterm = require("wezterm")

local M = {}

-- # Color palette
M.THEME = {
	pri = "#04ff04", -- {< replace_color(palette.hex.neonGreen) >}
	sec = "#000000", -- {< replace_color(palette.hex.black) >}
	bg_pri = "#000000", -- {< replace_color(palette.hex.black) >}
	bg_sec = "#04ff04", -- {< replace_color(palette.hex.neonGreen) >}
	danger = "#f38ba8", -- {< replace_color(palette.hex.danger) >}
	inactive = "#505050", -- {< replace_color(palette.hex.gray) >}
}

local function get_tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

function M.apply_to_config(config)
	-- ## FONT
	config.font = wezterm.font_with_fallback({ "0xProto Nerd Font", "Cascadia Code", "JetBrains Mono" }) -- {< replace_in(`'`, font) >}

	-- ## CONTENT ALIGNMENT
	config.window_content_alignment = {
		horizontal = "Center",
		vertical = "Center",
	}

	-- ## COLOR SCHEME
	config.color_scheme = "tokyonight_night"
	config.colors = {
		background = M.THEME.bg_pri,
		tab_bar = {
			background = M.THEME.bg_pri,
			active_tab = {
				bg_color = M.THEME.bg_sec,
				fg_color = M.THEME.sec,
			},
			inactive_tab = {
				bg_color = M.THEME.bg_pri,
				fg_color = M.THEME.pri,
			},
			inactive_tab_hover = {
				bg_color = M.THEME.inactive,
				fg_color = M.THEME.pri,
			},
			new_tab = {
				bg_color = M.THEME.bg_pri,
				fg_color = M.THEME.pri,
			},
		},
	}

	-- ## OPACITY
	config.window_background_opacity = 0.85
	config.inactive_pane_hsb = {
		brightness = 0.4,
	}

	-- ## TAB BAR
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false
	config.tab_max_width = 32

	-- ## PILLED TABS & HELPER
	local LEFT_EDGE = ""
	local RIGHT_EDGE = ""

	-- Format tab as a rounded edges
	wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
		local title = get_tab_title(tab)
		local clean_title = wezterm.truncate_right(title, max_width - 4)

		local bar_bg = M.THEME.bg_pri
		local edge_pri = M.THEME.pri
		local edge_sec = M.THEME.bg_pri

		if tab.is_active then
			edge_pri = M.THEME.sec
			edge_sec = M.THEME.bg_sec
		elseif hover then
			edge_pri = M.THEME.pri
			edge_sec = M.THEME.inactive
		end

		return {
			{ Background = { Color = bar_bg } },
			{ Foreground = { Color = edge_sec } },
			{ Text = LEFT_EDGE },

			{ Background = { Color = edge_sec } },
			{ Foreground = { Color = edge_pri } },
			{ Text = clean_title },

			{ Background = { Color = bar_bg } },
			{ Foreground = { Color = edge_sec } },
			{ Text = RIGHT_EDGE },
		}
	end)

	-- Leader Status & Vi Mode Indicator
	wezterm.on("update-status", function(window, pane)
		LEADER_ICON = "LEADER"

		local vi_mode = pane:get_user_vars().VI_MODE or "INSERT"

		local mode_text = ""
		local mode_background = M.THEME.pri
		local mode_foreground = M.THEME.sec

		if vi_mode == "NORMAL" then
			mode_text = " NORMAL "
			mode_foreground = M.THEME.pri
			mode_background = M.THEME.bg_pri
		elseif vi_mode == "INSERT" then
			mode_text = " INSERT "
			mode_foreground = M.THEME.sec
			mode_background = M.THEME.bg_sec
		end

		local leader = window:leader_is_active() and " " .. LEADER_ICON .. " " or ""

		window:set_left_status(wezterm.format({
			-- Vi Mode status
			{ Background = { Color = mode_background } },
			{ Foreground = { Color = mode_foreground } },
			{ Attribute = { Intensity = "Bold" } },
			{ Text = mode_text },

			-- Leader Status
			{ Background = { Color = M.THEME.bg_pri } },
			{ Foreground = { Color = M.THEME.danger } },
			{ Text = leader },

			-- Spacing
			{ Background = { Color = M.THEME.bg_pri } },
			{ Text = " " },
		}))
	end)
end

return M
