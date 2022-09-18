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
option.clipboard:append({ "unnamedplus" })
option.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- option.cmdheight = 0
option.splitbelow = true
option.laststatus = 3

option.foldcolumn = "1"
option.foldlevel = 10 -- Using ufo provider need a large value, feel free to decrease the value
option.foldlevelstart = -1
option.foldenable = true
option.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- NOTE: Local to window
option.number = true
option.relativenumber = true
option.cursorline = true
option.signcolumn = "yes"
option.list = true
option.listchars = [[tab:\ ,trail:-,eol:↵]]
option.foldmethod = "expr"
option.foldexpr = "nvim_treesitter#foldexpr()"

-- NOTE: Local to buffer
option.shiftwidth = 2
option.tabstop = 2
option.softtabstop = 2
option.expandtab = true
option.smartindent = true
option.swapfile = false
option.ignorecase = true
-- option.fileformat = 'unix'
