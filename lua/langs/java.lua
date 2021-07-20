local lsp = require('../lsp')

require('lspconfig').jdtls.setup({
    compatibility = lsp.compatibility,
    on_attach = lsp.on_attach,
})
