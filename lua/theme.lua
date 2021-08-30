local M = {
    red = '#F9867B',
    orange = '#CD9731',
    yellow = '#FDCE68',
    green = '#A3EEA0',
    cyan = '#6796E6',
    blue = '#7BE2F9',
    purple = '#E19EF5',
    tomato = '#F44747',
    white = '#FFFFFF',

    background = '#212835',
    dark_background = '#1B212C',

    border = '#3E4451',
    comment = '#5C6370',
    lineNumber = '#495162',
    scrollbar = '#4E5666',
    cursorLine = '#2C313A',
    indent = '#383C44',
}

M.signs = {
    Error = ' ',
    Warning = ' ',
    Hint = ' ',
    Information = ' ',
}

M.lspKindIcons = {
    Class = ' (class)',
    Color = ' (color)',
    Constant = ' (constant)',
    Constructor = ' (constructor)',
    Enum = ' (enum)',
    EnumMember = ' (enum member)',
    Event = ' (event)',
    Field = ' (field)',
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

return M
