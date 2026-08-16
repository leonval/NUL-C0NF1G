-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.allow_win32_input_mode = false

-- {% if SYSTEM.platform == "Windows" %}
--<yolk> config.default_prog = { "nu" }
-- {% else %}
config.default_prog = { "zsh" }
-- {% end %}

-- Remove window decoration if on Windows 11
--<yolk> config.window_decorations = "RESIZE" -- {< if SYSTEM.platform == "Windows" >}

local keymap = require("keymap")
local appearance = require("appearance")

keymap.apply_to_config(config)
appearance.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
