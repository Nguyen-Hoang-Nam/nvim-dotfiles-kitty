local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'ormolu',
        formatStdin = true,
    },
}

M.all_format = {
    efm = 'Ormolu',
}

M.default_format = 'efm'

M.lsp_server = 'hls'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
