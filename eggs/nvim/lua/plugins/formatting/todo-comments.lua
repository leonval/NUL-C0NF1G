return {
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
		keys = {
			{
				"<leader>ft",
				function()
					Snacks.picker.todo_comments()
				end,
				desc = "[F]ind [T]odo",
			},
			{
				"<leader>fT",
				function()
					Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "[F]ind [T]odo/Fix/Fixme",
			},
		},
	},
}
