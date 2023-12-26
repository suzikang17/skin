-- Fuzzy Finder (files, lsp, etc)
return {
  -- See `:help telescope` and `:help telescope.setup()`
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local fb_actions = require('telescope').extensions.file_browser.actions

      -- set telescope defaults
      telescope.setup({
        defaults = {
          -- ignore these files when using telscope file finders
          file_ignore_patterns = { 'data/', '^package-lock.json' },
          path_display = { 'truncate ' },
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous, -- move to prev result
              ['<C-j>'] = actions.move_selection_next, -- move to next result
              ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<S-n>'] = fb_actions.create,
              ['<S-r>'] = fb_actions.rename,
              ['<S-m>'] = fb_actions.move,
              ['<S-c>'] = fb_actions.copy,
              ['<S-x>'] = fb_actions.remove,
            },
          },
        },
        pickers = {
          find_files = { hidden = true },
        },
      })

      telescope.load_extension('fzf')

      -- set telescope keymaps
      local keymap = vim.keymap -- for conciseness
      local keys = {
        { '<leader>?', '<cmd>Telescope buffers<cr>', desc = '[?] Find recently opened files' },
        { '<leader><space>', function() require('telescope.builtin').buffers({}) end, '[ ] find existing buffers' },
        {
          '<leader>/',
          function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
              winblend = 10,
              previewer = false,
            }))
          end,
          '[/] fuzzily search in current buffer',
        },
        { '<leader>fg', function() require('telescope.builtin').git_files({}) end, 'search [g]it [f]iles' },
        { '<leader>ff', function() require('telescope.builtin').find_files({}) end, '[f]uzzy find [f]iles in cwd' },
        { '<leader>fsh', function() require('telescope.builtin').help_tags({}) end, '[f]ind [s]earch [h]elp' },
        { '<leader>fsw', function() require('telescope.builtin').grep_string({}) end, '[f]ind [s]earch current [w]ord under cursor' },
        { '<leader>fsg', function() require('telescope.builtin').live_grep({}) end, '[fuzzy] [s]earch by [g]rep' },
        { '<leader>fsd', function() require('telescope.builtin').diagnostics({}) end, '[f]ind [s]earch [d]iagnostics' },
        { '<leader>fr', '<cmd>Telescope oldfiles<cr>', '[f]ind [r]ecently opened files' },
        { '<leader>?', '<cmd>Telescope buffers<cr>', '[?] Find recently opened files' },
      }

      for i, km in ipairs(keys) do
        keymap.set('n', km[1], km[2], { desc = km[3] })
      end
    end,
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function() return vim.fn.executable('make') == 1 end,
  },
}
