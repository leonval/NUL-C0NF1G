-- install without yarn or npm
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = 'npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  keys = {
    { '<leader>mdv', ':MarkdownPreview<CR>', desc = '[M]ark[D]own Pre[V]iew' },
    { '<leader>mds', ':MarkdownPreviewStop<CR>', desc = '[M]ark[D]own Preview [S]top' },
  },
}
