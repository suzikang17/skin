-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.netrw_liststyle = 3

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg= "none" })

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Char count line guide
vim.opt.colorcolumn = '80'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
-- vim.o.background = "dark" -- or "light" for light mode
--
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true

-- Highlight current line
vim.o.cursorline = true

-- Window splits
vim.o.splitbelow = true
vim.o.splitright = true
vim.api.nvim_create_autocmd('VimLeave',{callback=function ()
    io.stdout:write("\027]111;;\027\\")
end})
vim.api.nvim_create_autocmd('ColorScheme',{callback=function ()
    local bg=vim.api.nvim_get_hl(0,{name='Normal',link=false}).bg
    io.stdout:write(("\027]11;#%06x\027\\"):format(bg))
end})

require('config.key_mappings')

