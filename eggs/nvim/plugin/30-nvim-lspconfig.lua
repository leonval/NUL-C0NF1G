vim.pack.add({ { src = gh("neovim/nvim-lspconfig") } })

vim.lsp.config("html", {
	filetypes = { "html", "blade" },
})

vim.lsp.config("phpactor", {
	filetypes = { "php", "blade" },
	init_options = {
		["language_server_phpstan.enabled"] = false,
		["language_server_psalm.enabled"] = false,
	},
})
