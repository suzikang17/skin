-- Fuzzy Finder (hjfiles, lsp, etc)
return {
  -- See `:help telescope` and `:help telescope.setup()`
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons',
      -- {
      --   'nvim-telescope/telescope-live-grep-args.nvim',
      --   -- This will not install any breaking changes.
      --   -- For major updates, this must be adjusted manually.
      --   version = '^1.0.0',
      -- },
    },

    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local fb_actions = require('telescope').extensions.file_browser.actions

      -- set telescope defaults
      telescope.setup({
        defaults = {
          preview = {
            filesize_limit = 0.1, -- MB
          },
          -- ignore these files when using telscope file finders
          file_ignore_patterns = { '^package-lock.json', '.git' },
          path_display = { 'truncate ' },
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous, -- move to prev result
              ['<C-j>'] = actions.move_selection_next, -- move to next result
              ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<C-n>'] = fb_actions.create,
              ['<C-r>'] = fb_actions.rename,
              ['<C-y>'] = fb_actions.copy,
              ['<C-x>'] = fb_actions.remove,
              -- ['<C-m>'] = fb_actions.move,
            },
          },
        },
        pickers = {
          find_files = { hidden = true },
        },
      })

      -- extension time
      telescope.load_extension('fzf')

      -- set telescope keymaps
      local keymap = vim.keymap -- for conciseness
      local builtin = require('telescope.builtin')

      local keys = {
        {
          '<leader>th',
          function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
              winblend = 10,
              previewer = false,
            }))
          end,
          '[/] fuzzily search in current buffer',
        },
        { '<C-f>f', function() builtin.find_files({ no_ignore = true }) end, 'all files in cwd' },
        { '<C-f>g', function() builtin.git_files({}) end, 'git files in cwd' },
        { '<C-f>o', function() builtin.oldfiles() end, 'old files' },
        { '<C-f>b', function() builtin.buffers() end, 'files from open buffers' },
        { '<C-f>s', function() builtin.find_files({ prompt_title = 'find sibling files', cwd = vim.fn.expand('%:p:h') }) end, 'sibling files' },
        { '<C-f>t', function() builtin.find_files({ prompt_title = 'test files', find_command = { 'fd', '-e', 'test.js' } }) end, 'find test files' },
        { '<C-f>n', function() builtin.find_files({ prompt_title = 'non-test files', find_command = { 'fd', '-E', '*test.js' } }) end, 'find non-test files' },

        { '<C-s>l', function() builtin.lsp_references() end, 'lsp references' },
        { '<C-s>k', function() builtin.keymaps() end, 'lsp references' },
        { '<C-s>h', function() builtin.help_tags({}) end, 'help' },
        { '<C-s>w', function() builtin.grep_string({}) end, 'current word under cursor' },
        { '<C-s>s', function() builtin.live_grep({ file_ignore_patterns = { 'package-lock.json', 'node_modules', '.git' } }) end, 'fuzzy search by grep' },
        { '<C-s>d', function() builtin.diagnostics({}) end, 'diagnostics' },
        { '<C-s>n', function() builtin.live_grep({ prompt_title = 'grep in non-test files', glob_pattern = '!*.test.js' }) end, 'grep word in non-test files' },
        { '<C-s>t', function() builtin.live_grep({ prompt_title = 'grep in test files', glob_pattern = '*.test.js' }) end, 'grep word in test files' },
        { '<C-s>z', function() builtin.resume({ noremap = true, silent = true }) end, 'resume grep' },

        { '<C-g>s', '<cmd>Telescope git_status<cr>', 'git status' },
        { '<C-g>c', '<cmd>Telescope git_bcommits<cr>', 'git buffer commits' },

        -- {
        --   '<leader>rg',
        --   function() require('telescope').extensions.live_grep_args.live_grep_args() end,
        --   'live grep searchy',
        -- },
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

  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
}
