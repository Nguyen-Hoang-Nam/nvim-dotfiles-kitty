local lsp = require('../lsp')

require('lspconfig').phpactor.setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
})
