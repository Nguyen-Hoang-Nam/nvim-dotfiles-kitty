local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')

local lsp = require('languages.lsp')

if not lspconfig.lemminx then
    configs.lemminx = {
        default_config = {
            cmd = {
                '/usr/lib/jvm/java-11-openjdk-amd64/bin/java',
                '-jar',
                '/home/nguyenhoangnam/.local/share/lsp/lemminx/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar',
            },
            filetypes = { 'xml' },
            root_dir = lspconfig.util.root_pattern('.git'),
            settings = {},
        },
    }
end

lspconfig.lemminx.setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
})
