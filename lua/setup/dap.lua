local dap = require('dap')
local sidebar = require('sidebar')

dap.defaults.fallback.terminal_win_cmd = ':belowright new | resize 10 | setlocal bt=nofile bh=wipe nobl noswapfile nu'

-- TODO: Find bigger icons
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

-- NOTE: Go dap
dap.adapters.go = function(callback, _)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
        stdio = { nil, stdout },
        args = { 'dap', '-l', '127.0.0.1:' .. port },
        detached = true,
    }

    handle, pid_or_err = vim.loop.spawn('dlv', opts, function(code)
        stdout:close()
        handle:close()
        if code ~= 0 then
            print('dlv exited with code', code)
        end
    end)

    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
            vim.schedule(function()
                require('dap.repl').append(chunk)
            end)
        end
    end)

    -- Wait for delve to start
    vim.defer_fn(function()
        callback({ type = 'server', host = '127.0.0.1', port = port })
    end, 100)
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
        type = 'go',
        name = 'Debug',
        request = 'launch',
        program = '${file}',
    },

    {
        type = 'go',
        name = 'Debug test', -- configuration for debugging test files
        request = 'launch',
        mode = 'test',
        program = '${file}',
    },

    {
        type = 'go',
        name = 'Debug test (go.mod)',
        request = 'launch',
        mode = 'test',
        program = './${relativeFileDirname}',
    },
}

-- NOTE: Nodejs dap
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.local/share/dap/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require('dap.utils').pick_process,
    },
}

-- NOTE: Haskell dap
dap.adapters.haskell = {
    type = 'executable',
    command = 'haskell-debug-adapter',
    args = { '--hackage-version=0.0.35.0' },
}

dap.configurations.haskell = {
    {
        type = 'haskell',
        request = 'launch',
        name = 'Debug',
        workspace = '${workspaceFolder}',
        startup = '${file}',
        stopOnEntry = true,
        logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
        logLevel = 'WARNING',
        ghciEnv = vim.empty_dict(),
        ghciPrompt = 'λ: ',
        -- Adjust the prompt to the prompt you see when you invoke the stack ghci command below
        ghciInitialPrompt = 'λ: ',
        ghciCmd = 'stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show',
    },
}

require('nvim-dap-virtual-text').setup()
