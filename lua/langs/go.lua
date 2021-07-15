local lsp = require('../lsp')

require('lspconfig').gopls.setup({
	capabilities = lsp.capabilities,
	cmd = { 'gopls', 'serve' },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
		},
		staticcheck = true,
	},
	on_attach = lsp.on_attach,
})
