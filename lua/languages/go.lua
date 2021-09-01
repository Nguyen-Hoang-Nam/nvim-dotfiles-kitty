local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'goimports',
        formatStdin = true,
    },
    {
        formatCommand = 'gofumpt',
        formatStdin = true,
    },
    {
        lintCommand = 'staticcheck ${INPUT}',
        lintFormats = {
            '%f:%l:%c: %m',
        },
    },
}

M.all_format = { efm = 'Goimports   Gofumpt' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    cmd = { 'gopls', 'serve' },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
        },
        staticcheck = true,
    },
    on_attach = lsp.on_attach,
}

return M
