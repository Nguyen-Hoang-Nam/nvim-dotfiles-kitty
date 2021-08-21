local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')

if not lspconfig.remark_parse then
    configs.remark_parse = {
        default_config = {
            cmd = { 'unified-language-server', '--parser=remark-parse', '--stdio' },
            filetypes = { 'markdown' },
            root_dir = lspconfig.util.root_pattern('.git'),
            settings = {},
        },
    }
end

lspconfig.remark_parse.setup(require('languages.markdown').lsp)
