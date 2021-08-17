local augroup = vim.api.nvim_exec

augroup(
    [[
augroup Terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber
    autocmd TermOpen * setlocal norelativenumber
augroup END
]],
    true
)

augroup(
    [[
augroup Config
    autocmd!
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
    autocmd VimEnter * set formatoptions-=cro
    autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif
augroup END
]],
    true
)

augroup(
    [[
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.xml,*.php,*.java,*.py,*.js,*.jsx,*.ts,*.svelte,*.go,*.lua,*.rs,*.tex,*.css,*.html,*.yaml,*.yml,*.json lua require('format').format()
augroup END
]],
    true
)

augroup(
    [[
augroup UpdateGlobal
    autocmd!
    autocmd FileType markdown,gitcommit setlocal spell
    autocmd Filetype go,tex set tabstop=2 | set shiftwidth=2
    autocmd BufRead,BufNewFile *.md,*.gitcommit setlocal spell
    autocmd CursorHold,CursorHoldI * lua require'utils'.code_action()
augroup END
]],
    true
)

augroup(
    [[
augroup StatusLine
    autocmd!
    autocmd BufEnter * lua require('statusline').load()
    autocmd BufWritePost * lua require('statusline').load()
augroup END
]],
    true
)
