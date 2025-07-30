require("config.opt")
require("config.lazy")
-- Setup lazy.nvim
require("lazy").setup(
	{
		{ import = "plugins" },
		{ import = "plugins.lsp" },
		{ import = "plugins.formatting" },
		{ import = "plugins.dev.markdown" },
		{ import = "plugins.dev.laravel" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	{
		install = {
			colorscheme = { "habamax" },
		},
		-- automatically check for plugin updates
		checker = {
			enabled = true,
			notify = false,
		},
		change_detection = {
			notify = true,
		},
	}
)
