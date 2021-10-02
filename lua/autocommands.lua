local augroup = vim.api.nvim_exec

vim.api.nvim_command("command! -range CommentToggle lua require('utils.comment').comment_toggle(<line1>, <line2>)")

augroup(
    [[
augroup Config
    autocmd!
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
    autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif
    autocmd bufenter * if (winnr("$") == 1 && &filetype == "Yanil") | q | endif

    autocmd VimEnter * WindLineFloatToggle
augroup END
]],
    true
)

augroup(
    [[
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre Dockerfile,*.md,*.php,*.py,*.js,*.jsx,*.ts,*.tsx,*.svelte,*.go,*.lua,*.rs,*.tex,*.css,*.html,*.yaml,*.yml,*.json lua require('format').format()
augroup END
]],
    true
)

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
-- augroup StatusLine
--     autocmd!
--     autocmd BufEnter * lua require('statusline').load()
--     autocmd BufWritePost * lua require('statusline').load()
-- augroup END
-- ]],
--     true
-- )
