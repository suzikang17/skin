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
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', { expr = true, silent = true })
vim.keymap.set('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', { expr = true, silent = true })

-- [[ Copy path to clipboard ]]
vim.keymap.set('n', '<Leader>cp', ':let @+ = expand("%")<CR>')

-- [[ Resizing Splits ]]
vim.keymap.set('n', '<C-l>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<C-h>', ':vertical resize -3<CR>')
vim.keymap.set('n', '<C-k>', ':resize +3<CR>')
vim.keymap.set('n', '<C-j>', ':resize -3<CR>')

-- Swap split orientation
-- [[ - -> | ]]
vim.keymap.set('n', '<leader>hv', '<C-w>t<C-w>H')
-- [[ | -> - ]]
vim.keymap.set('n', '<leader>vh', '<C-w>t<C-w>K')

vim.keymap.set('n', '<space>ft', ':Telescope file_browser<CR>', { noremap = true, desc = 'open [f]ile [t]ree' })
-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap('n', '<space>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = 'open [f]inder in dir of current [b]uffer', noremap = true })
