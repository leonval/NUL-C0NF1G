vim.pack.add({ { src = gh("folke/sidekick.nvim") } })

require("sidekick").setup({
	nes = { enabled = false },
	cli = {
		tools = {
			codex = { enabled = false },
			claude = { enabled = false },
			antigravity = {
				cmd = { "agy" },
			},
		},
	},
})

local keys = {
	{
		"n",
		"<leader>aa",
		function()
			require("sidekick.cli").focus({ name = "antigravity" })
		end,
		{ desc = "Focus [a]I CLI" },
	},
	{
		"n",
		"<leader>ap",
		function()
			require("sidekick.cli").prompt()
		end,
		{ desc = "Open [a]I [p]rompt" },
	},
}

set_keymaps(keys)
