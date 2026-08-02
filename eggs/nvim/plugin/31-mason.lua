vim.pack.add {{ src = gh 'mason-org/mason.nvim' }}

require('mason').setup({
    ui = {
	icons = {
	    package_installed = "✓",
	    package_pending = "➜",
	    package_uninstalled = "✗"
	}
    }
})
