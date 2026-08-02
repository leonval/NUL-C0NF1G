vim.pack.add {{ src = gh 'folke/snacks.nvim' }}

require 'snacks' .setup({
    picker = {
	enabled = true,
	matcher = { frecency = true },
	sources = {
	    lines = {
		layout = { preset = "dropdown" }
	    }
	},
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
})

local keys = {
    -- General
    {
	"n",
	"<leader><space>",
	function()
	    Snacks.picker.smart()
	end,
	{ desc = "Smart Find Files" },
    },
    {
	"n",
	"<leader>,",
	function()
	    Snacks.picker.buffers({
		on_show = function()
		    vim.cmd.stopinsert()
		end,
	    })
	end,
	{ desc = "[,] Buffers" },
    },
    {
	"n",
	"<leader>/",
	function()
	    Snacks.picker.grep()
	end,
	{ desc = "[/] Grep" },
    },
    {
	"n",
	"<leader>:",
	function()
	    Snacks.picker.command_history({
		on_show = function()
		    vim.cmd.stopinsert()
		end,
	    })
	end,
	{ desc = "[:] Command History" },
    },
    {
	"n",
	"<leader>.",
	function()
	    Snacks.picker.recent()
	end,
	{ desc = "[.] Recent Files" },
    },
    {
	"n",
	"<leader>fn",
	function()
	    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
	end,
	{ desc = "[F]ind [N]eovim Config" },
    },
    {
	"n",
	"<leader>ff",
	function()
	    Snacks.picker.files()
	end,
	{ desc = "[F]ind [F]iles" },
    },
    {
	"n",
	"<leader>fg",
	function()
	    Snacks.picker.git_files()
	end,
	{ desc = "[F]ind [G]it Files" },
    },
    {
	"n",
	"<leader>fp",
	function()
	    Snacks.picker.projects()
	end,
	{ desc = "[F]ind [P]rojects" },
    },
    {
	"n",
	"<leader>fk",
	function()
	    Snacks.picker.keymaps()
	end,
	{ desc = "[F]ind [K]eymaps" },
    },
    {
	"n",
	"<leader>q",
	function()
	    Snacks.picker.qflist()
	end,
	{ desc = "[Q]uickfix List" },
    },
    {
	"n",
	"<C-f>",
	function()
	    Snacks.picker.lines()
	end,
	{ desc = "Find In Current Buffer" },
    },
    {
	"n",
	"<leader>fh",
	function()
	    Snacks.picker.help()
	end,
	{ desc = "[F]ind [H]elp" },
    },

    -- LSP
    {
	"n",
	"gd",
	function()
	    Snacks.picker.lsp_definitions()
	end,
	{ desc = "[G]oto [D]efinition" },
    },
    {
	"n",
	"gD",
	function()
	    Snacks.picker.lsp_declarations()
	end,
	{ desc = "[G]oto [D]eclaration" },
    },
    {
	"n",
	"gr",
	function()
	    Snacks.picker.lsp_references()
	end,
	{ desc = "[G]oto [R]eferences", nowait = true },
    },
    {
	"n",
	"gI",
	function()
	    Snacks.picker.lsp_implementations()
	end,
	{ desc = "[G]oto [I]mplementation" },
    },
    {
	"n",
	"gy",
	function()
	    Snacks.picker.lsp_type_definitions()
	end,
	{ desc = "[G]oto T[y]pe Definition" },
    },
    {
	"n",
	"gs",
	function()
	    Snacks.picker.lsp_symbols()
	end,
	{ desc = "[G]oto LSP [S]ymbols" },
    },
    {
	"n",
	"gS",
	function()
	    Snacks.picker.lsp_workspace_symbols()
	end,
	{ desc = "[G]oto LSP Workspace [S]ymbols" },
    },
}

set_keymaps(keys)
