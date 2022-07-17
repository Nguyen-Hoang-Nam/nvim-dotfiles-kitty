local lsp = require("languages.lsp")

local sumneko_root_path = "/home/nguyenhoangnam/.local/share/tool/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
    efm = {
        {
            formatCommand = "stylua - --config-path ~/.config/stylua/stylua.toml",
            formatStdin = true,
        },
    },

    all_format = { efm = "Stylua" },
    default_format = "efm",
    lsp_server = "sumneko_lua",

    lsp = {
        capabilities = lsp.capabilities,

        on_attach = function(client, bufnr)
            lsp.on_attach(client, bufnr)
            require("nvim-navic").attach(client, bufnr)
        end,

        cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },

        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = runtime_path,
                },

                diagnostics = {
                    globals = { "vim" },
                },

                workspace = {
                    maxPreload = 2000,
                    preloadFileSize = 150,
                    library = vim.api.nvim_get_runtime_file("", true),
                },

                telemetry = {
                    enable = false,
                },
            },
        },
    },
}
