vim.pack.add({ { src = gh("mason-org/mason-lspconfig.nvim") } })

require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"lua_ls",
		"stylua",
	},
})
