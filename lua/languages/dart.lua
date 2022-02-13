local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = [[dart format -o show . | sed '$d']],
        formatStdin = true,
    },
}

M.all_format = { efm = '' }

M.default_format = 'efm'

M.lsp_server = 'dartls'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
