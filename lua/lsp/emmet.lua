local lspconfig = require('lspconfig')

local lsp = require('languages.lsp')

lspconfig.emmet_ls.setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    filetypes = { 'html', 'css', 'svelte', 'javascriptreact', 'typescriptreact' },
})
