--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keys = {
    {"n", "<Esc>", "<cmd>nohlsearch<CR>"}, -- Clear highlights on search when pressing <Esc> in normal mode

    -- Diagnostic keymaps
    -- {"n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" }},

    -- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
    -- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
    -- is not what someone will guess without a bit more experience.
    -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
    -- or just use <C-\><C-n> to exit terminal mode
    {"t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }},

    -- WINDOW
    {"n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" }},
    {"n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" }},
    {"n", "<leader>j", "<C-w><C-j>", { desc = "Move focus to the lower window" }},
    {"n", "<leader>k", "<C-w><C-k>", { desc = "Move focus to the upper window" }},

    {"n", "<leader>wv", ":vsplit<CR>", { desc = "[W]indow Split [V]ertical" }},
    {"n", "<leader>wh", ":split<CR>", { desc = "[W]indow Split [H]orizontal" }},

    -- # BUFFERS
    {"n", "<leader>fs", ":w<CR>", { desc = "[W]rite current buffer" }}, -- Write buffer shortcut
    {"n", "<leader>fq", ":q<CR>", { desc = "[Q]uit current buffer" }}, -- Quit buffer shortcut

    -- Disable arrow keys in normal mode
    {"n", "<left>", '<cmd>echo "Use h to move!!"<CR>'},
    {"n", "<right>", '<cmd>echo "Use l to move!!"<CR>'},
    {"n", "<up>", '<cmd>echo "Use k to move!!"<CR>'},
    {"n", "<down>", '<cmd>echo "Use j to move!!"<CR>'},

    -- Exit insert mode modification
    {"i", "jj", "<C-[>", { desc = "Exit insert mode" }},
}

function set_keymaps(keys)
    for _, map in ipairs(keys) do
	local mode = map[1]
	local key = map[2]
	local target = map[3]
	local opts = map[4] or {}

	-- Default silent to true if not explicitly set
	if opts.silent == nil then
	    opts.silent = true
	end

	vim.keymap.set(mode, key, target, opts)
    end
end

set_keymaps(keys)
