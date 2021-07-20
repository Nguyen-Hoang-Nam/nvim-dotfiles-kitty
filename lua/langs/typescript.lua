local lsp = require('../lsp')

require('lspconfig').tsserver.setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
})
