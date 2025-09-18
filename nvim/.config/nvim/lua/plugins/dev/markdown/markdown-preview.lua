return {
	"iamcco/markdown-preview.nvim",
	enabled = false,
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = "markdown",
	keys = {
		{
			"<leader>cp",
			":MarkdownPreview<cr>",
			desc = "Markdown [P]review",
		},
		{
			"<leader>cP",
			":MarkdownPreviewStop<cr>",
			desc = "[X] Markdown Preview Stop",
		},
	},
}
