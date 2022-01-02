local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'black --quiet -',
        formatStdin = true,
    },
    {
        lintCommand = 'flake8 --stdin-display-name ${INPUT} -',
        lintStdin = true,
        lintFormats = {
            '%f:%l:%c: %m',
        },
    },
}

M.all_format = { efm = 'Black' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
