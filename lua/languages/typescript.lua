local lsp = require("languages.lsp")
local M = {}

M.efm = {
    {
        formatCommand = "prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT}",
        formatStdin = true,
    },
    {
        -- lintCommand = 'eslint -f visualstudio --stdin --stdin-filename ${INPUT}',
        lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
        lintIgnoreExitCode = true,
        lintStdin = true,
        -- lintFormats = {
        --     '%f(%l,%c): %tarning %m',
        --     '%f(%l,%c): %rror %m',
        -- },
        lintFormats = { "%f:%l:%c: %m" },
    },
}

M.all_format = {
    efm = "Prettier",
    tsserver = "Tssever",
}

M.default_format = "efm"

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = function(client, bufnr)
        lsp.on_attach(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
    end,
}

return M
