vim.keymap.set('n', '<C-b>', '<CMD>Oil<CR>', {desc = 'open oil'})
vim.keymap.set('n', '<leader>of', '<CMD>Oil --float<CR>')

vim.keymap.set('n', '<leader>ww', '<CMD>:w<CR>')
vim.keymap.set('n', '<leader>wq', '<CMD>:wq<CR>')

-- open last buffer in v split right" --
vim.keymap.set('n', '<C-w>bl', '<CMD>vert belowright sb #<CR>', { desc = 'open last buffer to right split' })
vim.keymap.set('n', '<M-q>', ':bprev<CR>', { desc = 'open previous buffer' })
vim.keymap.set('n', '<M-w>', ':bnext<CR>', { desc = 'open previous buffer' })

-- move multiple lines up and down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- page up and down
vim.keymap.set('n', '<C-d', '<C-d>zz')
vim.keymap.set('n', '<C-u', '<C-u>zz')

-- paste keymbappe
vim.keymap.set('x', '<leader>p', '"_dP')

-- dont press capital Q
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- jk -> esc
vim.keymap.set('i', 'jk', '<esc>')

-- hard H and L (left and rights)
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'H', '^')

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })
vim.keymap.set('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })

-- [[ Copy path to clipboard ]]
vim.keymap.set('n', '<Leader>cp', ':let @+ = expand("%")<CR>')

-- [[ Resizing Splits ]] only direction when in top left
vim.keymap.set('n', '<a-l>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<a-h>', ':vertical resize -3<CR>')
vim.keymap.set('n', '<a-j>', ':resize +3<CR>')
vim.keymap.set('n', '<a-k>', ':resize -3<CR>')

-- Swap split orientation
-- [[ - -> | ]]
vim.keymap.set('n', '<leader>hv', '<C-w>t<C-w>H')
-- [[ | -> - ]]
vim.keymap.set('n', '<leader>vh', '<C-w>t<C-w>K')

vim.keymap.set('n', '<space>ft', ':Telescope file_browser<CR>', { noremap = true, desc = 'open [f]ile [t]ree' })
-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap('n', '<space>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = 'open [f]inder in dir of current [b]uffer', noremap = true })
vim.keymap.set('n', '<leader>Tsv', ':vsp term://', { desc = 'Open vertical terminal split' })
vim.keymap.set('n', '<leader>Tsh', ':sp term://', { desc = 'Open horizontal terminal split' })

-- Scrolling
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'scroll up and center' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'scroll down and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'keep cursor centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'keep cursor centered' })

-- Git
vim.keymap.set({ 'n', 'v' }, '<C-g>bf', ':GBrowse<cr>', { desc = 'Git browse current file in browser' })
vim.keymap.set('n', '<C-g>bc', function() vim.cmd('GBrowse!') end, { desc = 'Copy URL to current file' })
vim.keymap.set('v', '<C-g>bl', ':GBrowse!<CR>', { desc = 'Git browse current file and selected line in browser' })
vim.keymap.set('n', 'gd', ':Gvdiffsplit<CR>', { desc = 'Git diff current file' })

vim.keymap.set('n', '<BS>', '^', { desc = 'Move to first non-blank character' })
vim.keymap.set('n', 'L', 'vg_', { desc = 'Select to end of line' })
vim.keymap.set('n', '<leader>vp', 'ggVGp', { desc = 'select all and paste' })
vim.keymap.set('n', '<leader>vy', 'ggVG', { desc = 'select all' })
vim.keymap.set('n', '<leader>gp', '`[v`]', { desc = 'select pasted text' })
vim.keymap.set('n', '<leader>rcl', ':s/\\v', { desc = 'search and replace on line' })
vim.keymap.set('n', '<leader>rg', ':%s/\\v', { desc = 'search and replace in file' })
vim.keymap.set('v', '<leader><C-r>', '"hy:%s/\\v<C-r>h//g<left><left>', { desc = 'change selection' })
vim.keymap.set('i', '<c-p>', function() require('telescope.builtin').registers() end, { remap = true, silent = false, desc = ' and paste register in insert mode' })
vim.keymap.set('n', '<leader>df', ':%d_<cr>', { desc = 'delete file content to black hole register' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Quick save' })

-- Nerdtree
vim.keymap.set('n', '<leader>fb', ':NERDTreeToggle<CR>', { desc = 'toggle file browser' })

-- load last session
vim.keymap.set("n", "'s", function() require("persistence").load() end)
