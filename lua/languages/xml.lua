local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --tab-width=4 --xml-whitespace-sensitivity ignore --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
}

M.all_format = { efm = 'Prettier', lemminx = 'Lemminx' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    cmd = {
        '/usr/lib/jvm/java-11-openjdk-amd64/bin/java',
        '-jar',
        '/home/nguyenhoangnam/.local/share/lsp/lemminx/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar',
    },
}

return M
