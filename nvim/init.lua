require("config.opt")
require("config.lazy")
-- Setup lazy.nvim
require("lazy").setup(
	{
		{ import = "plugins" },
		{ import = "plugins.lsp" },
		{ import = "plugins.formatting" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	{
		install = {
			colorscheme = { "habamax" },
		},
		-- automatically check for plugin updates
		checker = { enabled = true },
		change_detection = {
			notify = true,
		},
	}
)
