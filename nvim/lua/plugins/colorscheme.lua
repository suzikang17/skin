return {
  -- {
  --   'deparr/tairiki.nvim',
  --   lazy = false,
  --   priority = 1000, -- only necessary if you use tairiki as default theme
  --   config = function()
  --     require('tairiki').setup({
  --       -- optional configuration here
  --     })
  --     require('tairiki').load() -- only necessary to use as default theme, has same behavior as ':colorscheme tairiki'
  --   end,
  -- },
  -- { 'EdenEast/nightfox.nvim', config = function() vim.cmd.colorscheme('nightfox') end },
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      -- Fonts
      vim.g.gruvbox_material_disable_italic_comment = 1
      vim.g.gruvbox_material_enable_italic = 0
      vim.g.gruvbox_material_enable_bold = 0
      -- vim.g.gruvbox_material_transparent_background = 1
      -- -- Themes
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_ui_contrast = 'high' -- The contrast of line numbers, indent lines, etc.
      vim.g.gruvbox_material_float_style = 'dim' -- Background of floating windows
      vim.cmd('colorscheme gruvbox-material')
    end,
  },

  -- { 'srcery-colors/srcery-vim', config = function() vim.cmd.colorscheme('srcery') end },
  -- {
  --   'eddyekofo94/gruvbox-flat.nvim',
  --   priority = 1000,
  --   enabled = true,
  --   config = function() vim.cmd([[colorscheme gruvbox-flat]]) end,
  -- },
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
