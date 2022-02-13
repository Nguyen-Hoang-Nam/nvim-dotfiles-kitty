local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = [[clang-format -style='{BasedOnStyle: LLVM, IndentWidth: 4}']],
        formatStdin = true,
    },
}

M.all_format = { efm = 'Clang' }

M.default_format = 'efm'

M.lsp_server = 'clangd'

-- Fix difference offset encoding in clangd and efm
local capabilities = lsp.capabilities
capabilities.offsetEncoding = { 'utf-16' }

M.lsp = {
    capabilities = capabilities,
    cmd = { 'clangd-12' },
    on_attach = lsp.on_attach,
}

return M
