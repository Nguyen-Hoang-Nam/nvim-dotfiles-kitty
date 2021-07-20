local lsp = require('../lsp')

require('lspconfig').rust_analyzer.setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    settings = {
        ['rust_analyzer'] = {
            cargo = {
                loadOutDirsFromCheck = true,
            },
        },
    },
})
