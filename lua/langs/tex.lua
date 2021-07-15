local lsp = require('../lsp')

require('lspconfig').texlab.setup({
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
})
