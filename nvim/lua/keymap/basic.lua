local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

return {
  map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list'),

  map('n', '<C-h>', '<C-w><C-h>', 'Move focus to the left window'),
  map('n', '<C-l>', '<C-w><C-l>', 'Move focus to the right window'),
  map('n', '<C-j>', '<C-w><C-j>', 'Move focus to the lower window'),
  map('n', '<C-k>', '<C-w><C-k>', 'Move focus to the upper window'),
}
