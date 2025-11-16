return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = {
			enabled = true,
			matcher = { frecency = true },
			formatters = {
				file = {
					filename_first = true,
				},
			},
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
						["<C-h>"] = { "toggle_hidden", mode = { "n" } },
						["<S-j>"] = { "preview_scroll_down", mode = { "n" } },
						["<S-k>"] = { "preview_scroll_up", mode = { "n" } },
					},
				},
			},
		},
	},
	keys = {
		-- General
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "[,] Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "[/] Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
			end,
			desc = "[:] Command History",
		},
		{
			"<leader>.",
			function()
				Snacks.picker.recent()
			end,
			desc = "[.] Recent Files",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[F]ind [N]eovim Config",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "[F]ind [G]it Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "[F]ind [P]rojects",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},
		{
			"<leader>q",
			function()
				Snacks.picker.qflist()
			end,
			desc = "[Q]uickfix List",
		},
		{
			"<C-f>",
			function()
				Snacks.picker.lines()
			end,
			desc = "Find In Current Buffer",
		},

		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "[G]oto [D]efinition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "[G]oto [D]eclaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "[G]oto [R]eferences",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "[G]oto [I]mplementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "[G]oto T[y]pe Definition",
		},
		{
			"gs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "[G]oto LSP [S]ymbols",
		},
		{
			"gS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "[G]oto LSP Workspace [S]ymbols",
		},
	},
}
