local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
    {
        lintCommand = './vendor/bin/psalm --output-format=emacs --no-progress',
        lintFormats = {
            '%f:%l:%c:%trror - %m',
            '%f:%l:%c:%tarning - %m',
        },
    },
}

M.all_format = { efm = 'Prettier' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
