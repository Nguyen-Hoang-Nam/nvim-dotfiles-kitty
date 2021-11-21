-- require('dap')
local dap = require('dap')

dap.defaults.fallback.terminal_win_cmd = ':belowright new | resize 10 | setlocal bt=nofile bh=wipe nobl noswapfile nu'

local M = {}

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = '', numhl = '' })

require('dapui').setup({
    icons = { expanded = '▾', collapsed = '▸' },

    mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
    },

    sidebar = {
        elements = {
            { id = 'scopes', size = 0.5 },
            { id = 'stacks', size = 0.5 },
        },
        size = 40,
        position = 'left',
    },

    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = 'single', -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { 'q', '<Esc>' },
        },
    },

    windows = { indent = 1 },
})

return M
