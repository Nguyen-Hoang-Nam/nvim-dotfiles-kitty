local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --config-precedence prefer-file --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
    {
        -- lintCommand = 'eslint -f visualstudio --stdin --stdin-filename ${INPUT}',
        lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
        lintIgnoreExitCode = true,
        lintStdin = true,
        -- lintFormats = {
        --     '%f(%l,%c): %tarning %m',
        --     '%f(%l,%c): %rror %m',
        -- },
        lintFormats = { '%f:%l:%c: %m' },
    },
}

M.all_format = {
    efm = 'Prettier',
    tsserver = 'Tssever',
}

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
