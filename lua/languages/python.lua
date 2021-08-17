local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'black --quiet -',
        formatStdin = true,
    },
}

M.all_format = { efm = 'Black' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
