vim.pack.add({ { src = gh("stevearc/conform.nvim") } })

require("conform").setup({
	formatters_by_ft = {
		blade = { "blade-formatter" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		php = { "pint" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
