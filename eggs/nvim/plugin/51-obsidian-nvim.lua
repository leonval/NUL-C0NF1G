vim.pack.add({ { src = gh("obsidian-nvim/obsidian.nvim"), version = vim.version.range("*") } })

require("obsidian").setup({
	legacy_commands = false, -- WARN: this will be removed in 4.0.0
	picker = {
		name = "snacks.picker",
	},
	workspaces = {
		{
			name = "thrones",
			path = "~/3-nul-thrones",
		},
	},
})
