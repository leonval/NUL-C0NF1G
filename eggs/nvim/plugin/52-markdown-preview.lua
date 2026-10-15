vim.pack.add({ { src = gh("sammaji/markdown-preview.nvim") } })

require("markdown-preview").setup({
	theme = "dark",
	auto_close = false,
})

local keys = {
	{
		"n",
		"<leader>cmp",
		"<cmd>MarkdownPreviewToggle<CR>",
		{ desc = "Toggle [m]arkdown [p]review" },
	},
}

set_keymaps(keys)
