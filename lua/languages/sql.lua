local lsp = require("languages.lsp")
local M = {}

M.efm = {}

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
}

return M
