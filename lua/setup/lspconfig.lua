local lsp = require('lspconfig')

lsp.cssls.setup(require('languages.css').lsp)
lsp.dockerls.setup(require('languages.docker').lsp)
lsp.gopls.setup(require('languages.go').lsp)
lsp.html.setup(require('languages.html').lsp)
-- lsp.jdtls.setup(require('languages.java').lsp)
lsp.sumneko_lua.setup(require('languages.lua').lsp)
lsp.phpactor.setup(require('languages.php').lsp)
lsp.pyright.setup(require('languages.python').lsp)
lsp.rust_analyzer.setup(require('languages.rust').lsp)
lsp.svelte.setup(require('languages.svelte').lsp)
lsp.texlab.setup(require('languages.tex').lsp)
lsp.tsserver.setup(require('languages.javascript').lsp)
lsp.yamlls.setup(require('languages.yaml').lsp)
lsp.jsonls.setup(require('languages.json').lsp)
lsp.lemminx.setup(require('languages.xml').lsp)
