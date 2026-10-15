vim.pack.add({ gh("stevearc/oil.nvim") })
require("oil").setup({
	default_file_explorer = false,
	delete_to_trash = true,
	keymaps = {
		["g?"] = { "actions.show_help", mode = "n" },
		["<CR>"] = "actions.select",
		["<leader>ts"] = { "actions.select", opts = { vertical = true } },
		-- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
		["<leader>te"] = { "actions.select", opts = { tab = true } },
		["<leader>tp"] = "actions.preview",
		["<Esc>"] = { "actions.close", mode = "n" },
		["q"] = { "actions.close", mode = "n" },
		["<C-l>"] = "actions.refresh",
		["-"] = { "actions.parent", mode = "n" },
		["_"] = { "actions.open_cwd", mode = "n" },
		["`"] = { "actions.cd", mode = "n" },
		["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		["gs"] = { "actions.change_sort", mode = "n" },
		["g."] = { "actions.toggle_hidden", mode = "n" },
		-- ["<C-h>"] = { "actions.toggle_hidden", mode = "n" }, # FIX: any keybind with ctrl dont work for some reason
		-- ["g\\"] = { "actions.toggle_trash", mode = "n" },
		["<leader>t\\"] = { "actions.toggle_trash", mode = "n" },
	},
	use_default_keymaps = false,
})

local keys = {
	{
		"n",
		"<leader>to",
		"<cmd>Oil<CR>",
		{ desc = "[t]oggle [o]il.nvim" },
	},
}

set_keymaps(keys)
