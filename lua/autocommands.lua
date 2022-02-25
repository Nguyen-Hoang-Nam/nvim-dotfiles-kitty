local augroup = vim.api.nvim_exec
local cmd = vim.api.nvim_command

-- Auto format
local setting_formatter_filetypes = require('settings').efm.filetypes
local map_filetype_filename = require('utils.core').map_filetype_filename

local autoformat_cmd = 'autocmd BufWritePre '
local i = 1
for _, filetype in pairs(setting_formatter_filetypes) do
    if i > 1 then
        autoformat_cmd = autoformat_cmd .. ','
    end

    autoformat_cmd = autoformat_cmd .. map_filetype_filename[filetype]

    i = i + 1
end

autoformat_cmd = autoformat_cmd .. [[ lua require('format').format()]]

cmd(autoformat_cmd)

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
augroup UpdateGlobal
    autocmd!
    autocmd CursorHold,CursorHoldI * lua require'utils.lightbulb'.code_action()
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

    autocmd FileType dapui* lua require('statusline').load()
    autocmd FileType dap-repl lua require('statusline').load()
    autocmd FileType aerial lua require('statusline').load()
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
