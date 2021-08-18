local lsp = require('languages.lsp')
local M = {}

-- M.efm = {
--     formatCommand = 'prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT}',
--     formatStdin = true,
-- }

M.all_format = { dockerls = 'DockerLS' }

M.default_format = 'dockerls'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
