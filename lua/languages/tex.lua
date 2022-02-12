local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'latexindent.pl -y="defaultIndent:\'  \'"',
        formatStdin = true,
    },
}

M.all_format = { efm = 'LatexIndent', texlab = 'TexLab' }

M.default_format = 'efm'

M.lsp_server = 'texlab'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

return M
