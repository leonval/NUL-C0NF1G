vim.cmd.packadd("nvim.undotree")

local keys = {
	{
		"n",
		"<leader>tu",
		require("undotree").open,
		{ desc = "[t]oggle [u]ndotree" },
	},
}

set_keymaps(keys)
