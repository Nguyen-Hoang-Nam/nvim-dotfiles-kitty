local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')

local lsp = require('../lsp')

if not lspconfig.emmet_ls then
    configs.emmet_ls = {
        default_config = {
            cmd = { 'emmet-ls', '--stdio' },
            filetypes = { 'html', 'css', 'svelte', 'javascriptreact' },
            -- root_dir = function(_)
            -- 	return vim.loop.cwd()
            -- end,

            root_dir = lspconfig.util.root_pattern('.git'),
            settings = {},
        },
    }
end

lspconfig.emmet_ls.setup({
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
})
