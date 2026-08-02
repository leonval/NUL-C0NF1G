vim.pack.add({ gh('stevearc/oil.nvim') })
require('oil').setup({
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
})

vim.keymap.set("n", "<leader>to", "<CMD>Oil<CR>", { desc = "Toggle Oil.nvim file picker" })
