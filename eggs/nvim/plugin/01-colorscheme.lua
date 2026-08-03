vim.pack.add {{ src = gh 'folke/tokyonight.nvim' }}
vim.cmd.colorscheme('tokyonight-night')
vim.api.nvim_set_hl(0, 'normal', { bg = 'none' })
