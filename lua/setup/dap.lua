local dap = require('dap')

require('jdtls.dap').setup_dap_main_class_configs()

-- dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

require('dapui').setup({
    icons = { expanded = '▾', collapsed = '▸' },

    mappings = {
        -- Use a table to apply multiple mappings
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
    },

    sidebar = {
        elements = {
            { id = 'scopes', size = 0.25 },
            -- { id = 'breakpoints', size = 0.25 },
            { id = 'stacks', size = 0.25 },
            { id = 'watches', size = 0.5 },
        },
        size = 50,
        position = 'left',
    },

    tray = {
        elements = { 'repl' },
        size = 10,
        position = 'bottom', -- Can be "left", "right", "top", "bottom"
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
