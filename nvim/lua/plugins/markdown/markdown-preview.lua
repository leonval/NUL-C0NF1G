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
    { '<leader>mdv', ':MarkdownPreview<CR>', desc = 'Markdown Preview' },
    { '<leader>mds', ':MarkdownPreviewStop<CR>', desc = 'Markdown Preview Stop' },
  },
}
