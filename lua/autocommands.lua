local augroup = vim.api.nvim_exec

-- augroup(
--     [[
-- augroup Terminal
--     autocmd!
--     autocmd TermOpen * setlocal nonumber
--     autocmd TermOpen * setlocal norelativenumber
-- augroup END
-- ]],
--     true
-- )

vim.api.nvim_command("command! -range CommentToggle lua require('utils.comment').comment_toggle(<line1>, <line2>)")

-- autocmd VimEnter * set formatoptions-=cro
augroup(
    [[
augroup Config
    autocmd!
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
    autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif
augroup END
]],
    true
)

augroup(
    [[
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre Dockerfile,*.md,*.xml,*.php,*.java,*.py,*.js,*.jsx,*.ts,*.tsx,*.svelte,*.go,*.lua,*.rs,*.tex,*.css,*.html,*.yaml,*.yml,*.json lua require('format').format()
augroup END
]],
    true
)

-- autocmd FileType markdown,gitcommit setlocal spell
-- autocmd Filetype go,tex set tabstop=2 | set shiftwidth=2
-- autocmd BufRead,BufNewFile *.md,*.gitcommit setlocal spell
augroup(
    [[
augroup UpdateGlobal
    autocmd!
    autocmd CursorHold,CursorHoldI * lua require'utils.lightbulb'.code_action()
augroup END
]],
    true
)

-- augroup(
--     [[
-- augroup YanilHighlights
--     autocmd!
--     autocmd FileType Yanil setlocal winhighlight=Normal:NvimTreeNormal
-- autogroup END
-- ]],
--     true
-- )

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
