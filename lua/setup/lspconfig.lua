local lsp = require('lspconfig')

local settings = require('settings')
local setting_lanuages = settings.languages
local filetypes = settings.lspconfigs.filetypes

for _, filetype in pairs(filetypes) do
    local language = setting_lanuages[filetype]
    lsp[language.lsp_server].setup(language.lsp)
end

-- lsp.ltex.setup(require('languages.markdown').lsp)
