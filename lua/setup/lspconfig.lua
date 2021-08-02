-- Credit https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
local signs = {
    Error = ' ',
    Warning = ' ',
    Hint = ' ',
    Information = ' ',
}

-- Credit https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
for type, icon in pairs(signs) do
    local hl = 'LspDiagnosticsSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Credit https://github.com/yamatsum/nvim-nonicons
local lspKindIcons = {
    Class = ' (class)',
    Color = ' (color)',
    Constant = ' (constant)',
    Constructor = ' (constructor)',
    Enum = ' (enum)',
    EnumMember = ' (enum member)',
    Event = ' (event)',
    Field = ' (field)',
    File = ' (file)',
    Folder = ' (folder)',
    Function = ' (function)',
    Interface = ' (interface)',
    Keyword = ' (keyword)',
    Method = ' (method)',
    Module = '{} (module)',
    Operator = ' (operator)',
    Property = ' (property)',
    Reference = ' (reference)',
    Snippet = ' (snippet)',
    Struct = ' (enum)',
    Text = ' (text)',
    TypeParameter = ' (type parameter)',
    Unit = ' (unit)',
    Value = ' (value)',
    Variable = ' (variable)',
}

-- Credit https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
    kinds[i] = lspKindIcons[kind] or kind
end
