local colors = require('../theme')

local base00 = '#282c34'
local base01 = '#353b45'
local base02 = '#3e4451'
local base03 = '#545862'
local base04 = '#565c64'
local base05 = '#abb2bf'
-- local base06 = '#b6bdca'
local base07 = '#c8ccd4'
local base08 = colors.red
local base09 = colors.orange
local base0A = colors.yellow
local base0B = colors.green
local base0C = colors.cyan
local base0D = colors.blue
local base0E = colors.purple
local base0F = colors.tomato

local cmd = vim.cmd

local function highlight(all_highlights)
    for group, ui in pairs(all_highlights) do
        local guifg = ui.guifg or 'NONE'
        local guibg = ui.guibg or 'NONE'
        local gui = ui.gui or 'NONE'
        if gui == 'underline' or gui == 'undercurl' then
            local guisp = ui.guisp or 'NONE'

            cmd(string.format('hi %s guifg=%s guibg=%s gui=%s guisp=%s', group, guifg, guibg, gui, guisp))
        else
            cmd(string.format('hi %s guifg=%s guibg=%s gui=%s', group, guifg, guibg, gui))
        end
    end
end

-- Credit https://github.com/RRethy/nvim-base16/blob/master/lua/base16-colorscheme.lua
highlight({
    -- General
    -- Conceal = { guifg = base0D, guibg = base00 },
    Cursor = { guifg = base00 },
    CursorLine = { guibg = colors.cursorLine },
    CursorLineNr = { guifg = base0A, guibg = colors.cursorLine },
    Directory = { guifg = base0D },
    -- EndOfBuffer = { guifg = colors.background },
    ErrorMsg = { guifg = base08, guibg = base00 },
    FoldColumn = { guifg = base0C, guibg = base01 },
    Folded = { guifg = base03, guibg = base01 },
    IncSearch = { guifg = base01, guibg = base09 },
    Italic = { gui = 'italic' },
    LineNr = { guifg = colors.lineNumber, guibg = colors.background },
    Macro = { guifg = base08 },
    MatchParen = { guibg = base03 },
    ModeMsg = { guifg = base0B },
    MoreMsg = { guifg = base0B },
    NonText = { guifg = colors.comment },
    Normal = { guifg = base05, guibg = colors.background },
    NormalFloat = { guifg = base05, guibg = base00 },
    FloatBorder = { guifg = base05, guibg = base00 },
    NormalNC = { guifg = base05, guibg = colors.background },
    Pmenu = { guifg = base05, guibg = colors.dark_background },
    PmenuSbar = { guifg = base05, guibg = base01 },
    PmenuSel = { guifg = colors.dark_background, guibg = base0B },
    PmenuThumb = { guifg = base05, guibg = base03 },
    Question = { guifg = base0D },
    QuickFixLine = { guibg = base01 },
    Search = { guifg = base01, guibg = base0A },
    SignColumn = { guifg = base04, guibg = colors.background },
    SpecialKey = { guifg = base03 },
    StatusLine = { guifg = base04, guibg = base02 },
    StatucLineNC = { guifg = colors.border, guibg = colors.dark_background, gui = 'underline' },
    Substitute = { guifg = base01, guibg = base0A },
    TabLine = { guifg = base04, guibg = base02 },
    TabLineFill = { guifg = base03, guibg = base01 },
    TabLineSel = { guifg = base0B, guibg = base01 },
    TermCursor = { guifg = base00, guibg = base05 },
    TermCursorNC = { guifg = base00, guibg = base05 },
    Title = { guifg = base0D },
    TooLong = { guifg = base08 },
    VertSplit = { guifg = colors.dark_background, guibg = colors.dark_background },
    Visual = { guibg = base02 },
    VisualNOS = { guifg = base08 },
    WarningMsg = { guifg = base08 },
    WildMenu = { guifg = base00, guibg = base05 },

    -- Spell
    SpellBad = { gui = 'undercurl', guisp = base08 },
    SpellLocal = { gui = 'undercurl', guisp = base0C },
    SpellCap = { gui = 'undercurl', guisp = base0D },
    SpellRare = { gui = 'undercurl', guisp = base0E },

    -- Syntax
    Comment = { guifg = base03, gui = 'italic' },
    Constant = { guifg = base09 },
    String = { guifg = base0B },
    Character = { guifg = base0C },
    Number = { guifg = base09 },
    Boolean = { guifg = base09 },
    Float = { guifg = base09 },
    Identifier = { guifg = base08 },
    Fuction = { guifg = base0D },
    Statement = { guifg = base0E },
    Conditional = { guifg = base0E },
    Repeat = { guifg = base0E },
    Label = { guifg = base0E },
    Operator = { guifg = base05 },
    Keyword = { guifg = base0E },
    Exception = { guifg = base0E },
    PreProc = { guifg = base0A },
    Include = { guifg = base0D },
    Define = { guifg = base0D },
    Marco = { guifg = base0D },
    PreCondit = { guifg = base0D },
    Type = { guifg = base0D },
    StorageClass = { guifg = base0E },
    Structure = { guifg = base0E },
    Special = { guifg = base0C },
    SpecialChar = { guifg = base0C },
    Tag = { guifg = base0A, gui = 'underline' },
    Delimiter = { guifg = base0F },
    SpecialComment = { guifg = base0C },
    Debug = { guifg = base08 },
    Underlined = { guifg = base05, gui = 'bold,underline' },
    Error = { guifg = base00, guibg = base08 },
    Todo = { guifg = base0A, guibg = base01 },

    -- LSP
    LspReferenceText = { gui = 'underline', guisp = base04 },
    LspReferenceRead = { gui = 'underline', guisp = base04 },
    LspReferenceWrite = { gui = 'underline', guisp = base04 },
    LspDiagnosticsDefaultError = { guifg = base08 },
    LspDiagnosticsDefaultWarning = { guifg = base0A },
    LspDiagnosticsDefaultInformation = { guifg = base0D },
    LspDiagnosticsDefaultHint = { guifg = base0B },
    LspDiagnosticsUnderlineError = { gui = 'undercurl', guisp = base08 },
    LspDiagnosticsUnderlineWarning = { gui = 'undercurl', guisp = base0A },
    LspDiagnosticsUnderlineInformation = { gui = 'undercurl', guisp = base0D },
    LspDiagnosticsUnderlineHint = { gui = 'undercurl', guisp = base0B },

    -- Treesitter
    TSAnnotation = { guifg = base0A },
    TSAttribute = { guifg = base0A },
    TSBoolean = { guifg = base09, gui = 'italic' },
    TSCharacter = { guifg = base0C },
    TSComment = { guifg = base03, gui = 'italic' },
    TSConstructor = { guifg = base0C },
    TSConditional = { guifg = base0E, gui = 'italic' },
    TSConstant = { guifg = base09, gui = 'italic' },
    TSConstBuiltin = { guifg = base0E },
    TSConstMacro = { guifg = base0E },
    TSError = { guifg = base08 },
    TSException = { guifg = base0E },
    TSField = { guifg = base08 },
    TSFloat = { guifg = base09, gui = 'italic' },
    TSFunction = { guifg = base0D },
    TSFuncBuiltin = { guifg = base0E, gui = 'italic' },
    TSFuncMarcro = { guifg = base0D },
    TSInclude = { guifg = base0D },
    TSKeyword = { guifg = base0E, gui = 'italic' },
    TSKeywordFunction = { guifg = base0E, gui = 'italic' },
    TSLabel = { guifg = base0E },
    TSMethod = { guifg = base0D },
    TSNamespace = { guifg = base0E },
    TSNone = { guifg = base0E },
    TSNumber = { guifg = base09, gui = 'italic' },
    TSOperator = { guifg = base0E },
    TSParameter = { guifg = base08 },
    TSParameterReference = { guifg = base08 },
    TSProperty = { guifg = base0A },
    TSPunctDelimiter = { guifg = base0F },
    TSPunctBracket = { guifg = base0C },
    TSPunctSpecial = { guifg = base0F },
    TSRepeat = { guifg = base0E, gui = 'italic' },
    TSString = { guifg = base0B },
    TSStringRegex = { guifg = base0B },
    TSStringEscape = { guifg = base0C },
    TSSymbol = { guifg = base0B },
    TSTag = { guifg = base0A },
    TSTagDelimiter = { guifg = base0F },
    TSText = { guifg = base05 },
    TSStrong = { gui = 'bold' },
    TSEmphasis = { guifg = base09, gui = 'italic' },
    TSUnderline = { guifg = base00, gui = 'underline' },
    TSStrike = { guifg = base00, gui = 'strikethrough' },
    TSTitle = { guifg = base0D },
    TSLiteral = { guifg = base09 },
    TSURI = { guifg = base09, gui = 'underline' },
    TSType = { guifg = base0A, gui = 'italic' },
    TSTypeBuiltin = { guifg = base0E },
    TSVariable = { guifg = base08 },
    TSVariableBuiltin = { guifg = base0E },
    TSDefinition = { gui = 'underline', guisp = base04 },
    TSDefinitionUsage = { gui = 'underline', guisp = base04 },
    TSCurrentScope = { gui = 'bold' },

    -- Diff
    DiffAdd = { guifg = base0B, guibg = base00 },
    DiffChange = { guifg = base03, guibg = base00 },
    DiffDelete = { guifg = base08, guibg = base00 },
    DiffText = { guifg = base0D, guibg = base00 },
    DiffAdded = { guifg = base0B, guibg = base00 },
    DiffFile = { guifg = base08, guibg = base00 },
    DiffNewFile = { guifg = base0B, guibg = base00 },
    DiffLine = { guifg = base0D, guibg = base00 },
    DiffRemoved = { guifg = base08, guibg = base00 },

    NvimInternalError = { guifg = base00, guibg = base08 },
})

vim.g.terminal_color_0 = base00
vim.g.terminal_color_1 = base08
vim.g.terminal_color_2 = base0B
vim.g.terminal_color_3 = base0A
vim.g.terminal_color_4 = base0D
vim.g.terminal_color_5 = base0E
vim.g.terminal_color_6 = base0C
vim.g.terminal_color_7 = base05
vim.g.terminal_color_8 = base03
vim.g.terminal_color_9 = base08
vim.g.terminal_color_10 = base0B
vim.g.terminal_color_11 = base0A
vim.g.terminal_color_12 = base0D
vim.g.terminal_color_13 = base0E
vim.g.terminal_color_14 = base0C
vim.g.terminal_color_15 = base07
