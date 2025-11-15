return {
	"ibhagwan/fzf-lua",
	enabled = true,
	dependencies = { "nvim-mini/mini.icons" },
	keys = {
		{
			"<leader><leader>",
			function()
				require("fzf-lua").files()
			end,
			desc = "[ ] Find Files (including dotfiles)",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "[F]ind File Using [G]rep",
		},
		{
			"<leader>fn",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[F]ind [N]eovim Files",
		},
		{
			"<leader>ff",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "[F]ind [F]zf Builtin",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[F]ind [B]uffers",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "[F]ind [H]elp Tags",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[F]ind Curent [W]ord",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[F]ind [.] Recent Files",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[F]ind Curent [W]ord",
		},
	},
}
