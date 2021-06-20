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
vim.go.shortmess = vim.go.shortmess .. 'c'
vim.go.clipboard = vim.go.clipboard .. 'unnamedplus'

-- Local to window
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.list = true
vim.opt.listchars = 'tab:▏\\ ,trail:-,eol:↵'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- Local to buffer
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.swapfile = false
