vim.g.have_nerd_font = true -- Use nerd font

vim.opt.mouse = "a" -- Enable mouse

-- # CLIPBOARD
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- # UNDO HISTORY
-- vim.opt.undofile = true

-- # SEARCH
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- # DELAYS
-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- # SPLITS
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split" -- Preview subtitution live when typing

-- # BUFFER
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor

-- # COMPLETION
vim.o.completeopt = 'menuone,noinsert,fuzzy,nosort'

-- # FORMATTING
-- ## WINDOW
vim.opt.number = true -- Show line number
vim.opt.relativenumber = true -- Use relative line number

vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

vim.opt.breakindent = true -- Show breakindent

vim.opt.signcolumn = "yes" -- Enable signcolumn

-- Sets how neovim will display certain whitespace characters in the editor
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.shiftwidth = 4

vim.opt.cursorline = true -- Show cursor line position

require('vim._core.ui2').enable() -- Use experimental ui2

-- ## POPUP MENU
vim.o.pumheight = 10
vim.o.pumborder = "rounded"
