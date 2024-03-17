return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd [[colorscheme gruvbox]]
  --   end,
  -- },
  --
  -- {
  --   -- Theme inspired by Atom
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function() vim.cmd.colorscheme('onedark') end,
  -- },
  -- { 'EdenEast/nightfox.nvim', config = function() vim.cmd.colorscheme('nightfox') end },
  -- {
  --   'sainnhe/gruvbox-material',
  --   priority = 1000,
  --
  --   config = function()
  --     vim.g.gruvbox_material_contrast = 'medium'
  --     vim.g.gruvbox_material_foreground = 'mix'
  --     vim.cmd.colorscheme('gruvbox-material')
  --   end,
  -- },
  {
    'sainnhe/everforest',
    priority = 1000,
    config = function() vim.cmd.colorscheme('everforest') end,
  },
  -- {
  --   'neanias/everforest-nvim',
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     require('everforest-nvim').setup({
  --       -- Your config here
  --     })
  --   end,
  -- },
}
