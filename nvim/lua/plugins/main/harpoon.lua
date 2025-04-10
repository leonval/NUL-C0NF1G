{
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = true,
  --[[
   local harpoon = require 'harpoon'
  -- REQUIRED
   harpoon:setup(),
  -- REQUIRED
  config = true,
  keys = {
    { '<leader>a', harpoon:list():add(), desc = '[A]dd to list' },
    { '<leader>th', harpoon.ui:toggle_quick_menu(harpoon:list()), desc = 'Toggle Quick Menu' },
    { '<leader>1', harpoon:list():select(1), desc = 'List [1]' },
    { '<leader>2', harpoon:list():select(2), desc = 'List [2]' },
    { '<leader>3', harpoon:list():select(3), desc = 'List [3]' },
    { '<leader>4', harpoon:list():select(4), desc = 'List [4]' },
    { '<C-S-P>', harpoon:list():prev() },
    { '<C-S-N>', harpoon:list():next() },
  },
  ]]
  keys = {
    { '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = '[A]dd to mark(s)' },
    { '<leader>hr', "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = '[R]emove from mark(s)' },
    { '<leader>th', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = '[T]oggle [H]arpoon Menu' },
    { '<leader>1', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = 'Harpoon Mark [1]' },
    { '<leader>2', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = 'Harpoon Mark [2]' },
    { '<leader>3', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = 'Harpoon Mark [3]' },
    { '<leader>4', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = 'Harpoon Mark [4]' },
    { '<leader>hn', "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = '[H]arpoon [N]ext' },
    { '<leader>hp', "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = '[H]arpoon [P]revious' },
  },
}
