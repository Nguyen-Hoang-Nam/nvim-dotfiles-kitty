local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'shfmt',
        formatStdin = true,
    },
    {
        lintCommand = 'shellcheck -f gcc -x',
        lintSource = 'shellcheck',
        lintFormats = {
            '%f:%l:%c: %trror: %m',
            '%f:%l:%c: %tarning: %m',
            '%f:%l:%c: %tote: %m',
        },
    },
}

M.all_format = {
    efm = 'Shfmt   shellcheck',
}

M.default_format = 'efm'

M.lsp_server = 'bashls'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
