return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = false,
		delete_to_trash = true,
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["l"] = { "actions.select", mode = "n" },
			["<leader>ts"] = { "actions.select", opts = { vertical = true } },
			-- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			["<leader>te"] = { "actions.select", opts = { tab = true } },
			["<leader>tp"] = "actions.preview",
			["<Esc>"] = { "actions.close", mode = "n" },
			["<C-l>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["h"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			-- ["g."] = { "actions.toggle_hidden", mode = "n" },
			["<C-h>"] = { "actions.toggle_hidden", mode = "n" },
			-- ["g\\"] = { "actions.toggle_trash", mode = "n" },
			["<leader>t\\"] = { "actions.toggle_trash", mode = "n" },
		},
		use_default_keymaps = false,
		view_options = {
			show_hidden = true,
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
	    { "<leader>to", ":Oil<CR>", desc = "Toggle Oil.nvim file picker" }
	}
}
