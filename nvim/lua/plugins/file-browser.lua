return {
  {
    'preservim/nerdtree',
    config = function()
      vim.g.NERDTreeWinSize = 46
      vim.g.NERDTreeWinPos = 'right'
    end,
  },
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    },
    config = true
  }
}
