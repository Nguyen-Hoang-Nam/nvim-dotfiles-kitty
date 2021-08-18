local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT} --plugin-search-dir .',
        formatStdin = true,
    },
}

M.all_format = { efm = 'Pretter-Plugin-Svelte' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
