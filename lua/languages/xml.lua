local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --tab-width=2 --xml-whitespace-sensitivity ignore --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
}

M.all_format = { efm = 'Prettier', lemminx = 'Lemminx' }

M.default_format = 'efm'

M.lsp_server = 'lemminx'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    cmd = {
        'java',
        '-jar',
        '/home/nguyenhoangnam/.local/share/lsp/lemminx/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar',
    },
}

return M
