local option = vim.opt

-- NOTE: Global
option.smartcase = true
option.updatetime = 300
option.splitright = true
option.showmatch = true
option.showmode = false
option.showtabline = 2
option.scrolloff = 18
option.termguicolors = true
option.shortmess = "atOIc"
-- option.completeopt = 'menuone,noselect'
-- option.shortmess:append({ c = true, F = true, T = true })
option.clipboard:append({ "unnamedplus" })
option.fillchars = "eob: "
option.cmdheight = 0

-- NOTE: Local to window
option.number = true
option.relativenumber = true
option.cursorline = true
option.signcolumn = "yes"
option.list = true
option.listchars = "tab:\\ ,trail:-,eol:↵"
option.foldmethod = "expr"
option.foldexpr = "nvim_treesitter#foldexpr()"
-- HACK: indent-blankline https://github.com/lukas-reineke/indent-blankline.nvim/issues/59#issuecomment-806398054
option.colorcolumn = "99999"

-- NOTE: Local to buffer
option.shiftwidth = 4
option.tabstop = 4
option.softtabstop = 4
option.expandtab = true
option.smartindent = true
option.swapfile = false
option.ignorecase = true
-- option.fileformat = 'unix'
