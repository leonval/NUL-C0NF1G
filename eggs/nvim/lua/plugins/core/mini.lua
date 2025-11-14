return { -- Collection of various small independent plugins/modules
	"nvim-mini/mini.nvim",
	enabled = true,
	config = function()
		require("mini.ai").setup({ n_lines = 500 })

		require("mini.surround").setup()

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

		require("mini.files").setup({
			mappings = {
				close = "<Esc>",
			},
			options = { permanent_delete = false },
		})
	end,
}
