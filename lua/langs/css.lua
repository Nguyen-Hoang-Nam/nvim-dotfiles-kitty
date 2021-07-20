local lsp = require('../lsp')

require('lspconfig').cssls.setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
})
