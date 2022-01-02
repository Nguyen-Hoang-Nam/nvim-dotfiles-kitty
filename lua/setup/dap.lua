local dap = require('dap')
local sidebar = require('sidebar')

dap.defaults.fallback.terminal_win_cmd = ':belowright new | resize 10 | setlocal bt=nofile bh=wipe nobl noswapfile nu'

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
        size = sidebar.sidebar_width,
        position = sidebar.sidebar_position,
    },

    floating = {
        max_height = nil,
        max_width = nil,
        border = 'single',
        mappings = {
            close = { 'q', '<Esc>' },
        },
    },

    windows = { indent = 1 },
})

require('nvim-dap-virtual-text').setup()
