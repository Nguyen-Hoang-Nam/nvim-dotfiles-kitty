local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'mix format -',
        formatStdin = true,
    },
}

M.all_format = {
    efm = 'Mix',
}

M.default_format = 'efm'

M.lsp_server = 'elixirls'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    cmd = { '/home/nguyenhoangnam/.local/share/lsp/elixir-ls/language_server.sh' },
}

return M
