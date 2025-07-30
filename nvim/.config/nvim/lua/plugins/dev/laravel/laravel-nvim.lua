return {
	"adalessa/laravel.nvim",
	dependencies = {
		"tpope/vim-dotenv",
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"kevinhwang91/promise-async",
	},
	cmd = { "Laravel" },
	keys = {
		{ "<leader>cla", ":Laravel artisan<cr>" },
		{ "<leader>clr", ":Laravel routes<cr>" },
		{ "<leader>clm", ":Laravel related<cr>" },
	},
	event = { "VeryLazy" },
	opts = {},
	config = true,
}
