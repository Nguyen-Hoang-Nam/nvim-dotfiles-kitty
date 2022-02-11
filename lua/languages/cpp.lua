local lsp = require('languages.lsp')
local M = {}

M.efm = {}

M.all_format = { efm = '' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    cmd = { 'clangd-12' },
    on_attach = lsp.on_attach,
}

return M
