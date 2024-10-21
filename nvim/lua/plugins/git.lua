return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsign = require('gitsigns')

        local function map(mode, l, r, desc, opts)
          opts = opts or {}
          desc = desc or  ""
          opts.buffer = bufnr
          opts.desc = '(gitsigns) ' .. desc
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<C-g>[', gitsign.prev_hunk, 'prev hunk')
        map('n', '<C-g>]', gitsign.next_hunk, 'next hunk')
        map('n', '<C-g>p', gitsign.preview_hunk, 'preview hunk')
        map('n', '<C-g>s', gitsign.stage_hunk, 'stage hunk')
        map('n', '<C-g>u', gitsign.undo_stage_hunk, 'undo stage hunk')
        map('n', '<C-g>r', gitsign.reset_hunk, 'reset hunk')
        map('v', '<C-g>s', function() gitsign.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
        map('v', '<C-g>r', function() gitsign.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
        map('n', '<C-g>S', gitsign.stage_buffer, 'stage buffer')
        map('n', '<C-g>R', gitsign.reset_buffer, 'reset buffer')
        map('n', '<C-g>b', function() gitsign.blame_line({ full = true }) end, 'blame line')
        map('n', '<C-g>tb', gitsign.toggle_current_line_blame, 'toggle blame line for each line')
        map('n', '<C-g>dt', gitsign.diffthis, 'diff this')
        map('n', '<C-g>D~', function() gitsign.diffthis('~') end, 'diff to head')
        map('n', '<C-g>Do', function() gitsign.diffthis('origin/main') end, 'diff to head')
        map('n', '<C-g>td', gitsign.toggle_deleted, 'toggle deleted')
      end,
    },
  },
  {
    'sindrets/diffview.nvim',
    keys = {  '<C-g>dd', ':DiffviewOpen<CR>', desc = '(diffview) open'}

  },
  {
    'tpope/vim-fugitive',

  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
      -- optional for floating window border decoration
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
        { '<C-g>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
      },
    },
  },
  -- {
  --   'NeogitOrg/neogit',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim', -- required
  --     'sindrets/diffview.nvim', -- optional - Diff integration
  --
  --     -- Only one of these is needed, not both.
  --     'nvim-telescope/telescope.nvim', -- optional
  --     'ibhagwan/fzf-lua', -- optional
  --   },
  --   config = true,
  -- },
}
