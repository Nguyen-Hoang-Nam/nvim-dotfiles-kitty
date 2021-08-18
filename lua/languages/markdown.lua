-- local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
}

M.all_format = { efm = 'Prettier' }

M.default_format = 'efm'

return M
