return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.surround').setup()
    require('mini/comment').setup()
  end,
}
