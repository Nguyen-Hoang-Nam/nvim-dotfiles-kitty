local lsp = require('languages.lsp')

-- local prettier = {
--     formatCommand = 'prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT}',
--     formatStdin = true,
-- }

-- local prettier_plugin_svelte = {
--     formatCommand = 'prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT} --plugin-search-dir .',
--     formatStdin = true,
-- }

-- local prettier_plugin_xml = {
--     formatCommand = 'prettier --tab-width=4 --xml-whitespace-sensitivity ignore --stdin-filepath ${INPUT}',
--     formatStdin = true,
-- }

-- local black = {
--     formatCommand = 'black --quiet -',
--     formatStdin = true,
-- }

-- local goimports = {
--     formatCommand = 'goimports',
--     formatStdin = true,
-- }

-- local gofumpt = {
--     formatCommand = 'gofumpt',
--     formatStdin = true,
-- }

-- local rustfmt = {
--     formatCommand = 'rustfmt --edition 2018',
--     formatStdin = true,
-- }

-- local stylua = {
--     formatCommand = 'stylua - --config-path ~/.config/stylua/stylua.toml',
--     formatStdin = true,
-- }

-- local latexindent = {
--     formatCommand = 'latexindent.pl -y="defaultIndent:\'  \'"',
--     formatStdin = true,
-- }

require('lspconfig').efm.setup({
    root_dir = require('lspconfig').util.root_pattern('.git'),
    filetypes = {
        'javascript',
        'typescript',
        'typescriptreact',
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
        'xml',
    },

    init_options = { documentFormatting = true, codeAction = true },
    settings = {
        rootMarkers = { '.git/' },
        languages = {
            javascript = require('languages.javascript').efm,
            typescript = require('languages.typescript').efm,
            typescriptreact = require('languages.typescript').efm,
            javascriptreact = require('languages.javascript').efm,
            svelte = require('languages.svelte').efm,
            python = require('languages.python').efm,
            go = require('languages.go').efm,
            rust = require('languages.rust').efm,
            lua = require('languages.lua').efm,
            tex = require('languages.tex').efm,
            markdown = require('languages.markdown').efm,
            yaml = require('languages.yaml').efm,
            json = require('languages.json').efm,
            html = require('languages.html').efm,
            css = require('languages.css').efm,
            java = require('languages.java').efm,
            php = require('languages.php').efm,
            xml = require('languages.xml').efm,
        },
    },
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
})
