local lsp = require("languages.lsp")
local M = {}

M.efm = {
    {
        formatCommand = "prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT}",
        formatStdin = true,
    },

    {
        lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
        lintIgnoreExitCode = true,
        lintStdin = true,
        lintFormats = { "%f:%l:%c: %m" },
    },
}

M.all_format = {
    efm = "Prettier Eslint",
    tsserver = "Tssever",
}

M.default_format = "efm"

M.lsp_server = "tsserver"

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
