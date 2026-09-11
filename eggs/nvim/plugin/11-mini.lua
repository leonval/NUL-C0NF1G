vim.pack.add({ gh("nvim-mini/mini.nvim") })

require("mini.icons").setup()

require("mini.ai").setup({ n_lines = 500 })

require("mini.surround").setup()

require("mini.pairs").setup()

local statusline = require("mini.statusline")

-- set use_icons to true if you have a Nerd Font
statusline.setup({ use_icons = vim.g.have_nerd_font })

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
	return "%2l:%-2v"
end

require("mini.bufremove").setup()

require("mini.animate").setup()

-- disable completion while snack picker is visible
vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks_picker_input",
	desc = "Disable mini.completion for snacks picker",
	group = vim.api.nvim_create_augroup("user_mini", {}),
	command = "lua vim.b.minicompletion_disable=true",
})

require("mini.completion").setup({})

require("mini.indentscope").setup({ symbol = "|" })

require("mini.notify").setup()

require("mini.git").setup()

local keys = {
	{
		"i",
		"<Tab>",
		function()
			-- Returns <C-y> (or <C-n>) when popup is open, otherwise sends literal
			return vim.fn.pumvisible() == 1 and "<C-y>" or "<Tab>"
		end,
		{ expr = true, desc = "Accept Completion" },
	},
	{
		"n",
		"<leader>bd",
		"<Cmd>lua MiniBufremove.delete()<CR>",
		{ desc = "[b]uffer [d]elete current" },
	},
	{
		"n",
		"<leader>ba",
		function()
			local current = vim.api.nvim_get_current_buf()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if buf ~= current and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
					MiniBufremove.delete(buf, false)
				end
			end
			if vim.api.nvim_buf_is_valid(current) and vim.bo[current].buflisted then
				MiniBufremove.delete(current, false)
			end
		end,
		{ desc = "[b]uffers delete [a]ll " },
	},
	-- Delete all buffers EXCEPT current active one
	{
		"n",
		"<leader>bo",
		function()
			local current = vim.api.nvim_get_current_buf()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if buf ~= current and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
					MiniBufremove.delete(buf, false)
				end
			end
		end,
		{ desc = "[b]uffers delete [o]ther" },
	},
	{
		"n",
		"<leader>tn",
		function()
			MiniNotify.show_history()
		end,
		{ desc = "[t]oggle [n]otification history" },
	},
}

set_keymaps(keys)
