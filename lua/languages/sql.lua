local lsp = require("languages.lsp")
local M = {}

M.efm = {
    -- {
    --     formatCommand = "prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT}",
    --     formatStdin = true,
    -- },

    -- {
    --     lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    --     lintIgnoreExitCode = true,
    --     lintStdin = true,
    --     lintFormats = { "%f:%l:%c: %m" },
    -- },
}

M.all_format = {
    efm = "",
}

M.default_format = "efm"

M.lsp_server = "sqls"

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = function(client, bufnr)
        require("sqls").on_attach(client, bufnr)
    end,
    root_dir = function()
        return vim.fn.getcwd()
    end,
    cmd = { "sqls" },
}

return M
