local lsp = require('../lsp')

local capabilities = lsp.capabilities
-- capabilities.textDocument.completion.completionItem.resolved_capabilities.document_formatting = false

require('lspconfig').tsserver.setup({
    capabilities = capabilities,
    on_attach = lsp.on_attach,
})
