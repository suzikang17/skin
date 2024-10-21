-- install with yarn or npm
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  keys = { { '<leader>mdp', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Preview Toggle' } },
  build = 'cd app && yarn install',
  init = function() vim.g.mkdp_filetypes = { 'markdown', 'text' } end,
  ft = { 'markdown', 'handlebars' },
}
