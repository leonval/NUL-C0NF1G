vim.pack.add { { src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' } }
require('nvim-treesitter').setup()
require('nvim-treesitter').install {
	'blade',
	'css',
	'html',
	'javascript',
	'lua',
	'make',
	'php',
	'toml',
	'yaml',
	'zsh' }
