local lsp = require('languages.lsp')
local M = {}

-- M.efm = {
--     {
--         formatCommand = 'rustfmt --edition 2018',
--         formatStdin = true,
--     },
-- }

M.all_format = {
    -- efm = 'Rustfmt',
    hls = 'Haskell Language Server',
}

M.default_format = 'hls'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
