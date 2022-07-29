local lsp = require('languages.lsp')

return {
    lsp_server = 'tailwindcss',
    lsp = {
        capabilities = lsp.capabilities,
        on_attach = lsp.on_attach,
        root_dir = require('lspconfig.util').root_pattern('tailwind.config.js'),
        filetypes = { 'html', 'svelte', 'javascriptreact', 'typescriptreact' },
    },
}
