local lsp = require('../lsp')

require('lspconfig').html.setup({
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
})
