-- plugs that dont require extra setup
return {
  change_detection = { notify = false },
  { 'echasnovski/mini.nvim', version = false, config = function() require('mini.surround').setup() end },
  { 'github/copilot.vim' },
  { 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' },
  {
    'folke/zen-mode.nvim',
    keys = { '<leader>zm', '<cmd>ZenMode', desc = 'Toggle Zen Mode' },
    opts = {},
  },
  { 'folke/neodev.nvim', opts = {} },
  -- { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  'nvim-pack/nvim-spectre',
  'szw/vim-maximizer',
  {
    'stevearc/dressing.nvim',
    config = true,
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {},
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        -- theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {
          { 'filename', path = 3 },
        },
        lualine_c = { 'buffers' },
        lualine_x = { 'mode', 'fileformat', 'filetype' },
      },
    },
  },
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- {
  --   -- Add indentation guides even on blank lines
  --   'lukas-reineke/indent-blankline.nvim',
  --   main = 'ibl',
  --   opts = {
  --     indent = {
  --       char = '┊',
  --     },
  --   },
  -- },
}
