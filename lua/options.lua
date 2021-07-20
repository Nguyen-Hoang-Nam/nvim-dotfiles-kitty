-- Global
vim.opt.smartcase = true
vim.opt.updatetime = 300
vim.opt.splitright = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.showtabline = 2
vim.opt.scrolloff = 18
vim.opt.termguicolors = true
vim.opt.completeopt = 'menuone,noselect'
vim.go.shortmess = vim.go.shortmess .. 'c'
vim.go.clipboard = vim.go.clipboard .. 'unnamedplus'

-- Local to window
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.list = true
-- vim.opt.listchars = 'tab:▏\\ ,trail:-,eol:↵'
vim.opt.listchars = 'trail:-,eol:↵'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- Hack indent-blankline https://github.com/lukas-reineke/indent-blankline.nvim/issues/59#issuecomment-806398054
vim.opt.colorcolumn = '99999'

-- Local to buffer
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
