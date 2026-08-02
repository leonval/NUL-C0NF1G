vim.pack.add {{ src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' }}
require('nvim-treesitter').setup()
require('nvim-treesitter').install { 'lua', 'make', 'toml', 'yaml', 'zsh' }
