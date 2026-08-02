vim.pack.add {{ src = gh 'folke/todo-comments.nvim' }}
require('todo-comments').setup({
    signs = false,
})

local keys = {
    {
	"n",
	"<leader>ft",
	function()
	    Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
	end,
	{ desc = "[f]ind [t]odo/Fix/Fixme" },
    },
    {
	"n",
	"<leader>fT",
	function()
	    Snacks.picker.todo_comments()
	end,
	{ desc = "[f]ind [T]odo" },
    },
}

set_keymaps(keys)
