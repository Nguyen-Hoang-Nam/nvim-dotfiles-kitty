local option = vim.opt

-- Global
option.smartcase = true
option.updatetime = 300
option.splitright = true
option.showmatch = true
option.showmode = false
option.hidden = true
option.showtabline = 2
option.scrolloff = 18
option.termguicolors = true
option.completeopt = 'menuone,noselect'
option.shortmess:append({ c = true })
-- vim.go.shortmess = vim.go.shortmess .. 'c'
-- vim.go.clipboard = vim.go.clipboard .. 'unnamedplus'
option.clipboard:append({ 'unnamedplus' })
-- vim.go.fillchars = 'eob: '
option.fillchars = 'eob: '

-- Local to window
option.number = true
option.relativenumber = true
option.cursorline = true
option.signcolumn = 'yes'
option.list = true
option.listchars = 'trail:-,eol:↵'
option.foldmethod = 'expr'
option.foldexpr = 'nvim_treesitter#foldexpr()'
-- Hack indent-blankline https://github.com/lukas-reineke/indent-blankline.nvim/issues/59#issuecomment-806398054
option.colorcolumn = '99999'

-- Local to buffer
option.shiftwidth = 4
option.tabstop = 4
option.expandtab = true
option.smartindent = true
option.swapfile = false
