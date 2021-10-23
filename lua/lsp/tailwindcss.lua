local lspconfig = require('lspconfig')

local lsp = require('languages.lsp')

lspconfig.tailwindcss.setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    root_dir = require('lspconfig.util').root_pattern('tailwind.config.js'),
    filetype = { 'html', 'svelte', 'javascriptreact' },
})
