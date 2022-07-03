local dap = require("dap")
local sidebar = require("sidebar")

local go = require("dap.go")
local haskell = require("dap.haskell")

dap.defaults.fallback.terminal_win_cmd = ":belowright new | resize 10 | setlocal bt=nofile bh=wipe nobl noswapfile nu"

-- TODO: Find bigger icons
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })

require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },

    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },

    layouts = {
        elements = {
            { id = "scopes", size = 0.5 },
            { id = "stacks", size = 0.5 },
        },
        size = sidebar.sidebar_width,
        position = sidebar.sidebar_position,
    },

    floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
            close = { "q", "<Esc>" },
        },
    },

    windows = { indent = 1 },
})

dap.adapters.go = go.adapters
dap.configurations.go = go.configuration

-- NOTE: Nodejs dap
dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/.local/share/dap/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
    {
        name = "Launch",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach to process",
        type = "node2",
        request = "attach",
        processId = require("dap.utils").pick_process,
    },
}

dap.adapters.haskell = haskell.adapters
dap.configurations.haskell = haskell.configuration

require("nvim-dap-virtual-text").setup()
