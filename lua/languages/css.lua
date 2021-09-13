local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
}

M.all_format = { efm = 'Prettier' }

M.default_format = 'efm'

local capabilities = lsp.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.lsp = {
    capabilities,
    on_attach = lsp.on_attach,
}

return M
