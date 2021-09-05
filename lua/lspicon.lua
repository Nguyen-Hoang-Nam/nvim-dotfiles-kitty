local fn = vim.fn
local theme = require('theme')

local signs = theme.signs

-- Credit https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
for type, icon in pairs(signs) do
    local hl = 'LspDiagnosticsSign' .. type
    fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

fn.sign_define('CodeActionSign', { text = '', texthl = 'LspDiagnosticsDefaultInformation' })

local lspKindIcons = theme.lspKindIcons

-- Credit https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
    kinds[i] = lspKindIcons[kind] or kind
end
