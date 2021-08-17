local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --tab-width=4 --xml-whitespace-sensitivity ignore --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
}

M.all_format = { efm = 'Prettier' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
