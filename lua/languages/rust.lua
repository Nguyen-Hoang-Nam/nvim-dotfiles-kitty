local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'rustfmt --edition 2018',
        formatStdin = true,
    },
}

M.all_format = {
    efm = 'Rustfmt',
    rust_analyzer = 'Rust-Analyzer',
}

M.default_format = 'efm'

M.lsp_server = 'rust_analyzer'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    settings = {
        ['rust_analyzer'] = {
            cargo = {
                loadOutDirsFromCheck = true,
            },
        },
    },
}

return M
