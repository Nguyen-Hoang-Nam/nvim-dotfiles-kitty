local lsp = require('languages.lsp')
local M = {}

M.lsp_server = 'cmake'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
