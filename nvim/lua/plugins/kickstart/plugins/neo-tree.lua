-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>tt', ':Neotree reveal float<CR>', desc = 'NeoTree reveal' },
    { '<leader>tb', ':Neotree buffers float<CR>', desc = 'NeoTree buffer' },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<leader>tt'] = 'close_window',
        },
      },
      filtered_items = {
        hide_gitignored = false,
        hide_dotfiles = false,
      },
    },
  },
}
