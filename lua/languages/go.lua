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
        lintCommand = 'golangci-lint run',
        lintIgnoreExitCode = true,
        lintStdin = true,
        lintFormats = {
            '%f:%l:%c: %m',
        },
    },
}

M.all_format = { efm = 'Goimports   Gofumpt   Golangci' }

M.default_format = 'efm'

M.lsp_server = 'gopls'

M.lsp = {
    capabilities = lsp.capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
        },
    },
    on_attach = lsp.on_attach,
}

return M
