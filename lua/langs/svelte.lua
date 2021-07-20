local lsp = require('../lsp')

require('lspconfig').svelte.setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
})
