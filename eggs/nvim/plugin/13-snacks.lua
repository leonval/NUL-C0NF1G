vim.pack.add {{ src = gh 'folke/snacks.nvim' }}

require 'snacks' .setup({
    picker = {
	enabled = true,
	matcher = {
	    frecency = true,
	    history_bonus = true,
	},
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
	    Snacks.picker.files({ hidden = true })
	end,
	{ desc = "Find Files" },
    },
    {
	"n",
	"<leader>,",
	function()
	    Snacks.picker.buffers({
		focus = 'list',
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
	{ desc = "[f]ind [n]eovim Config" },
    },
    {
	"n",
	"<leader>ff",
	function()
	    Snacks.picker.files()
	end,
	{ desc = "[f]ind [f]iles" },
    },
    {
	"n",
	"<leader>fg",
	function()
	    Snacks.picker.git_files()
	end,
	{ desc = "[f]ind [g]it Files" },
    },
    {
	"n",
	"<leader>fp",
	function()
	    Snacks.picker.projects()
	end,
	{ desc = "[f]ind [p]rojects" },
    },
    {
	"n",
	"<leader>fk",
	function()
	    Snacks.picker.keymaps()
	end,
	{ desc = "[f]ind [k]eymaps" },
    },
    {
	"n",
	"<leader>q",
	function()
	    Snacks.picker.qflist()
	end,
	{ desc = "[q]uickfix List" },
    },
    {
	"n",
	"<C-f>",
	function()
	    Snacks.picker.lines()
	end,
	{ desc = "Find in Current Buffer" },
    },
    {
	"n",
	"<leader>fh",
	function()
	    Snacks.picker.help()
	end,
	{ desc = "[f]ind [h]elp" },
    },

    -- LSP
    {
	"n",
	"gd",
	function()
	    Snacks.picker.lsp_definitions()
	end,
	{ desc = "[g]oto [d]efinition" },
    },
    {
	"n",
	"gD",
	function()
	    Snacks.picker.lsp_declarations()
	end,
	{ desc = "[g]oto [D]eclaration" },
    },
    {
	"n",
	"gr",
	function()
	    Snacks.picker.lsp_references()
	end,
	{ desc = "[g]oto [r]eferences", nowait = true },
    },
    {
	"n",
	"gI",
	function()
	    Snacks.picker.lsp_implementations()
	end,
	{ desc = "[g]oto [I]mplementation" },
    },
    {
	"n",
	"gy",
	function()
	    Snacks.picker.lsp_type_definitions()
	end,
	{ desc = "[g]oto T[y]pe Definition" },
    },
    {
	"n",
	"gs",
	function()
	    Snacks.picker.lsp_symbols()
	end,
	{ desc = "[g]oto LSP [s]ymbols" },
    },
    {
	"n",
	"gS",
	function()
	    Snacks.picker.lsp_workspace_symbols()
	end,
	{ desc = "[g]oto LSP Workspace [S]ymbols" },
    },
}

set_keymaps(keys)
