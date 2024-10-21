return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = 'lazygit', direction = 'float', hidden = true })

    function _lazygit_toggle() lazygit:toggle() end

    vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
  end,
}