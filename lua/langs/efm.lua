local lsp = require('../lsp')

local prettier = {
    formatCommand = 'prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT}',
    formatStdin = true,
}

local prettier_plugin_svelte = {
    formatCommand = 'prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT} --plugin-search-dir .',
    formatStdin = true,
}

local black = {
    formatCommand = 'black --quiet -',
    formatStdin = true,
}

local goimports = {
    formatCommand = 'goimports',
    formatStdin = true,
}

local gofumpt = {
    formatCommand = 'gofumpt',
    formatStdin = true,
}

local rustfmt = {
    formatCommand = 'rustfmt --edition 2018',
    formatStdin = true,
}

local stylua = {
    formatCommand = 'stylua - --config-path ~/.config/stylua/stylua.toml',
    formatStdin = true,
}

local latexindent = {
    formatCommand = 'latexindent.pl -y="defaultIndent:\'  \'"',
    formatStdin = true,
}

require('lspconfig').efm.setup({
    root_dir = require('lspconfig').util.root_pattern('.git'),
    filetypes = {
        'javascript',
        'typescript',
        'javascriptreact',
        'svelte',
        'python',
        'go',
        'rust',
        'lua',
        'tex',
        'markdown',
        'yaml',
        'json',
        'html',
        'css',
        'java',
        'php',
    },

    init_options = { documentFormatting = true, codeAction = true },
    settings = {
        rootMarkers = { '.git/' },
        languages = {
            javascript = { prettier },
            typescript = { prettier },
            javascriptreact = { prettier },
            svelte = { prettier_plugin_svelte },
            python = { black },
            go = { goimports, gofumpt },
            rust = { rustfmt },
            lua = { stylua },
            tex = { latexindent },
            markdown = { prettier },
            yaml = { prettier },
            json = { prettier },
            html = { prettier },
            css = { prettier },
            java = { prettier },
            php = { prettier },
        },
    },
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
})
