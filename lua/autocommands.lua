local augroup = vim.api.nvim_exec
local cmd = vim.api.nvim_command
local utils = require("utils.core")

-- Auto format
utils.autocommand_by_filetypes(
    require("settings").autoformat.filetypes,
    "BufWritePre",
    [[lua require('format').format()]]
)

-- Code action
utils.autocommand_by_filetypes(
    require("settings").codeaction.filetypes,
    "CursorHold,CursorHoldI",
    [[lua require('utils.lightbulb').code_action()]]
)

-- Toggle comment
cmd("command! -range CommentToggle lua require('utils.comment').comment_toggle(<line1>, <line2>)")

augroup(
    [[
augroup Config
    autocmd!
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
    autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif
    autocmd bufenter * if (winnr("$") == 2 && &filetype == "Yanil") | q | endif
    autocmd BufNewFile,BufRead *.sol set filetype=solidity
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

    autocmd BufEnter * lua require('winbar').load()
    autocmd BufWritePost * lua require('winbar').load()

    autocmd FileType dapui* lua require('statusline').load()
    autocmd FileType dap-repl lua require('statusline').load()
    autocmd FileType aerial lua require('statusline').load()
    autocmd FileType sqls_output lua require('statusline').load()
augroup END
]],
    true
)

augroup(
    [[
augroup Highlight
    autocmd!
    autocmd FileType dapui* setlocal winhighlight=Normal:DapUINormal
    autocmd FileType aerial setlocal winhighlight=Normal:AerialNormal
    autocmd FileType DiffviewFiles setlocal winhighlight=Normal:DiffviewFilesNormal
augroup END
]],
    true
)
