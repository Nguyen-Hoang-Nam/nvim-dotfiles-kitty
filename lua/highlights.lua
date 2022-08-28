local colors = require("settings").colors

local base00 = "#282c34"
local base01 = "#353b45"
-- local base02 = "#3e4451"
local base03 = "#545862"
local base04 = "#565c64"
local base05 = "#abb2bf"
-- local base06 = '#b6bdca'
local base07 = "#c8ccd4"
local base08 = colors.red
local base09 = colors.orange
local base0A = colors.yellow
local base0B = colors.green
local base0C = colors.cyan
local base0D = colors.blue
local base0E = colors.purple
local base0F = colors.tomato

local function nvim_set_hl(name, val)
    vim.api.nvim_set_hl(0, name, val)
end

nvim_set_hl("Cursor", { fg = base00 })
nvim_set_hl("CursorLine", { bg = colors.cursorLine })
nvim_set_hl("CursorLineNr", { fg = base0A, bg = colors.cursorLine })
nvim_set_hl("Directory", { fg = base0D })
nvim_set_hl("EndOfBuffer", { fg = colors.comment })
nvim_set_hl("ErrorMsg", { fg = base08, bg = colors.background })
nvim_set_hl("Folded", { fg = colors.comment, bg = colors.cursorLine })
nvim_set_hl("FoldColumn", { fg = colors.comment, bg = colors.background })
nvim_set_hl("IncSearch", { fg = base01, bg = base09 })
nvim_set_hl("LineNr", { fg = colors.lineNumber, bg = colors.background })
nvim_set_hl("MatchParen", { bg = base03 })
nvim_set_hl("MoreMsg", { fg = base0B })
nvim_set_hl("NonText", { fg = colors.comment })
nvim_set_hl("Normal", { bg = colors.background })
nvim_set_hl("NormalFloat", { fg = base05, bg = colors.dark_background })
nvim_set_hl("NormalNC", { bg = colors.background })
nvim_set_hl("FloatBorder", { fg = base05, bg = base00 })
nvim_set_hl("ColorColumn", { bg = colors.cursorLine })

nvim_set_hl("Pmenu", { fg = base05, bg = colors.dark_background })
nvim_set_hl("PmenuSbar", { fg = base05, bg = colors.dark_background })
nvim_set_hl("PmenuSel", { fg = colors.dark_background, bg = base0B })
nvim_set_hl("PmenuThumb", { fg = base05, bg = colors.scrollbar })

nvim_set_hl("CmpItemMenu", { fg = base05, bg = colors.dark_background })
nvim_set_hl("CmpItemKind", { fg = base0C })
nvim_set_hl("CmpItemKindMethod", { fg = base0A })
nvim_set_hl("CmpItemKindFunction", { fg = base0E })
nvim_set_hl("CmpItemAbbrMatchFuzzy", { fg = base0B })
nvim_set_hl("CmpItemAbbrMatch", { fg = base0B })
nvim_set_hl("CmpItemAbbr", { fg = base05 })
nvim_set_hl("CmpItemAbbrDeprecated", { fg = "#ffffff" })

nvim_set_hl("Question", { fg = base0D })
nvim_set_hl("Search", { fg = base01, bg = base0A })
nvim_set_hl("SignColumn", { fg = base04, bg = colors.background })
nvim_set_hl("SpecialKey", { fg = base03 })
nvim_set_hl("StatusLine", { fg = colors.dark_background, bg = colors.dark_background })
nvim_set_hl("StatucLineNC", { fg = colors.dark_background, bg = colors.dark_background, underline = true })
nvim_set_hl("Substitute", { fg = base01, bg = base0A })
nvim_set_hl("TermCursor", { fg = colors.background, bg = base0C })
nvim_set_hl("TermCursorNC", { fg = colors.background, bg = base05 })
nvim_set_hl("Title", { fg = base0D })
nvim_set_hl("VertSplit", { fg = colors.dark_background, bg = colors.dark_background })
nvim_set_hl("Visual", { bg = colors.cursorLine })
nvim_set_hl("VisualNOS", { fg = base08 })
nvim_set_hl("WarningMsg", { fg = base08 })

nvim_set_hl("SpellBad", { undercurl = true, sp = base08 })
nvim_set_hl("SpellLocal", { undercurl = true, sp = base0C })
nvim_set_hl("SpellCap", { undercurl = true, sp = base0D })
nvim_set_hl("SpellRare", { undercurl = true, sp = base0E })

nvim_set_hl("Comment", { fg = base03, italic = true })
nvim_set_hl("Constant", { fg = base09, italic = true })
nvim_set_hl("String", { fg = base0B })
nvim_set_hl("Character", { fg = base0C })
nvim_set_hl("Number", { fg = base09, italic = true })
nvim_set_hl("Boolean", { fg = base09, italic = true })
nvim_set_hl("Float", { fg = base09, italic = true })
nvim_set_hl("Identifier", { fg = base08 })
nvim_set_hl("Fuction", { fg = base0D })
nvim_set_hl("Statement", { fg = base0E })
nvim_set_hl("Conditional", { fg = base0E, italic = true })
nvim_set_hl("Repeat", { fg = base0E, italic = true })
nvim_set_hl("Label", { fg = base0E })
nvim_set_hl("Operator", { fg = base05 })
nvim_set_hl("Keyword", { fg = base0E, italic = true })
nvim_set_hl("Exception", { fg = base0E })
nvim_set_hl("PreProc", { fg = base0A })
nvim_set_hl("Include", { fg = base0D })
nvim_set_hl("Define", { fg = base0D })
nvim_set_hl("Marco", { fg = base0D })
nvim_set_hl("PreCondit", { fg = base0D })
nvim_set_hl("Type", { fg = base0D })
nvim_set_hl("TypeDef", { fg = base0A })
nvim_set_hl("StorageClass", { fg = base0E })
nvim_set_hl("Structure", { fg = base0E })
nvim_set_hl("Special", { fg = base0C })
nvim_set_hl("SpecialChar", { fg = base0C })
nvim_set_hl("Tag", { fg = base0A, underline = true })
nvim_set_hl("Delimiter", { fg = base0F })
nvim_set_hl("SpecialComment", { fg = base0C })
nvim_set_hl("Debug", { fg = base08 })
nvim_set_hl("Underlined", { fg = base05, bold = true, underline = true })
nvim_set_hl("Error", { fg = base00, bg = base08 })
nvim_set_hl("Todo", { fg = base0A, bg = base01 })

nvim_set_hl("LspReferenceText", { underline = true, sp = base04 })
nvim_set_hl("LspReferenceRead", { underline = true, sp = base04 })
nvim_set_hl("LspReferenceWrite", { underline = true, sp = base04 })
nvim_set_hl("DiagnosticError", { fg = base08 })
nvim_set_hl("DiagnosticWarn", { fg = base0A })
nvim_set_hl("DiagnosticInfo", { fg = base0D })
nvim_set_hl("DiagnosticHint", { fg = base0B })
nvim_set_hl("DiagnosticUnderlineError", { undercurl = true, sp = base08 })
nvim_set_hl("DiagnosticUnderlineWarn", { undercurl = true, sp = base0A })
nvim_set_hl("DiagnosticUnderlineInfo", { undercurl = true, sp = base0D })
nvim_set_hl("DiagnosticUnderlineHint", { undercurl = true, sp = base0B })

nvim_set_hl("CodeActionSign", { fg = base0A })

nvim_set_hl("AerialNormal", { bg = colors.dark_background })
nvim_set_hl("DapUINormal", { bg = colors.dark_background })
nvim_set_hl("DiffviewFilesNormal", { bg = colors.dark_background })

nvim_set_hl("TSAnnotation", { fg = base0A })
nvim_set_hl("TSAttribute", { fg = base0A })
nvim_set_hl("TSBoolean", { fg = base09, italic = true })
nvim_set_hl("TSCharacter", { fg = base0C })
nvim_set_hl("TSComment", { fg = base03, italic = true })
nvim_set_hl("TSConstructor", { fg = base0C })
nvim_set_hl("TSConditional", { fg = base0E, italic = true })
nvim_set_hl("TSConstant", { fg = base09, italic = true })
nvim_set_hl("TSConstBuiltin", { fg = base0E })
nvim_set_hl("TSConstMacro", { fg = base0E })
nvim_set_hl("TSError", { fg = base08 })
nvim_set_hl("TSException", { fg = base0E })
nvim_set_hl("TSField", { fg = base08 })
nvim_set_hl("TSFloat", { fg = base09, italic = true })
nvim_set_hl("TSFunction", { fg = base0D })
nvim_set_hl("TSFuncBuiltin", { fg = base0E, italic = true })
nvim_set_hl("TSFuncMarcro", { fg = base0D })
nvim_set_hl("TSInclude", { fg = base0D })
nvim_set_hl("TSKeyword", { fg = base0E, italic = true })
nvim_set_hl("TSKeywordFunction", { fg = base0E, italic = true })
nvim_set_hl("TSKeywordOperator", { fg = base0E, italic = true })
nvim_set_hl("TSLabel", { fg = base0E })
nvim_set_hl("TSMethod", { fg = base0D })
nvim_set_hl("TSNamespace", { fg = base0E })
nvim_set_hl("TSNone", { fg = base0E })
nvim_set_hl("TSNumber", { fg = base09, italic = true })
nvim_set_hl("TSOperator", { fg = base0E })
nvim_set_hl("TSParameter", { fg = base08 })
nvim_set_hl("TSParameterReference", { fg = base08 })
nvim_set_hl("TSProperty", { fg = base0A })
nvim_set_hl("TSPunctDelimiter", { fg = base0F })
nvim_set_hl("TSPunctBracket", { fg = base0C })
nvim_set_hl("TSPunctSpecial", { fg = base0F })
nvim_set_hl("TSRepeat", { fg = base0E, italic = true })
nvim_set_hl("TSString", { fg = base0B })
nvim_set_hl("TSStringRegex", { fg = base0B })
nvim_set_hl("TSStringEscape", { fg = base0C })
nvim_set_hl("TSStringSpecial", { fg = base0B })
nvim_set_hl("TSSymbol", { fg = base0B })
nvim_set_hl("TSTag", { fg = base0A })
nvim_set_hl("TSTagAttribute", { fg = base0A })
nvim_set_hl("TSTagDelimiter", { fg = base0F })
nvim_set_hl("TSText", { fg = base08 })
nvim_set_hl("TSStrong", { bold = true })
nvim_set_hl("TSEmphasis", { fg = base09, italic = true })
nvim_set_hl("TSUnderline", { fg = base00, underline = true })
nvim_set_hl("TSStrike", { fg = base00, strikethrough = true })
nvim_set_hl("TSTitle", { fg = base0D })
nvim_set_hl("TSLiteral", { fg = base09 })
nvim_set_hl("TSURI", { fg = base09, underline = true })
nvim_set_hl("TSMath", { fg = base0E })
nvim_set_hl("TSType", { fg = base0A, italic = true })
nvim_set_hl("TSTypeBuiltin", { fg = base0E })
nvim_set_hl("TSVariable", { fg = base08 })
nvim_set_hl("TSVariableBuiltin", { fg = base0E, italic = true })

nvim_set_hl("DiffAdd", { fg = base0B, bg = base00 })
nvim_set_hl("DiffChange", { fg = base03, bg = base00 })
nvim_set_hl("DiffDelete", { fg = base08, bg = base00 })
nvim_set_hl("DiffText", { fg = base0D, bg = base00 })
nvim_set_hl("DiffAdded", { fg = base0B, bg = base00 })
nvim_set_hl("DiffFile", { fg = base08, bg = base00 })
nvim_set_hl("DiffNewFile", { fg = base0B, bg = base00 })
nvim_set_hl("DiffLine", { fg = base0D, bg = base00 })
nvim_set_hl("DiffRemoved", { fg = base08, bg = base00 })

nvim_set_hl("IndentBlanklineContextChar", { fg = base0A })

nvim_set_hl("StatuslineBackground", { bg = colors.dark_background })
nvim_set_hl("StatuslineEmptyBackground", { fg = colors.dark_background, bg = colors.dark_background })
nvim_set_hl("StatuslineDiagnosticsError", { fg = base08, bg = colors.dark_background })
nvim_set_hl("StatuslineDiagnosticsWarning", { fg = base0A, bg = colors.dark_background })
nvim_set_hl("StatuslineDiffAdded", { fg = base0B, bg = colors.dark_background })
nvim_set_hl("StatuslineDiffModified", { fg = base0D, bg = colors.dark_background })
nvim_set_hl("StatuslineDiffRemoved", { fg = base08, bg = colors.dark_background })
nvim_set_hl("StatuslineSmiley", { fg = base0A, bg = colors.dark_background })
nvim_set_hl("StatuslineTest", { fg = base0A, bg = colors.dark_background })
nvim_set_hl("StatuslinePassed", { fg = base0B, bg = colors.dark_background })
nvim_set_hl("StatuslineFailed", { fg = base08, bg = colors.dark_background })
nvim_set_hl("StatuslineRunning", { fg = base0D, bg = colors.dark_background })

nvim_set_hl("DapBreakpoint", { fg = base08 })
nvim_set_hl("DapStopped", { fg = base0B })

nvim_set_hl("GitSignsAdd", { fg = base0B, bg = colors.background })
nvim_set_hl("GitSignsChange", { fg = base0D, bg = colors.background })
nvim_set_hl("GitSignsDelete", { fg = base08, bg = colors.background })
nvim_set_hl("GitSignsCurrentLineBlame", { fg = colors.comment })

nvim_set_hl("TroubleNormal", { bg = colors.dark_background })

nvim_set_hl("YanilNormal", { bg = colors.dark_background })
nvim_set_hl("YanilDeviconDirectory", { fg = "#cccccc" })
nvim_set_hl("YanilDeviconDirectory", { fg = "#cccccc" })
nvim_set_hl("YanilDeviconFile", { fg = "#cccccc" })
nvim_set_hl("YanilTreeRoot", { fg = colors.white })
nvim_set_hl("YanilGitModified", { fg = base0A })
nvim_set_hl("YanilGitDirty", { fg = base0A })
nvim_set_hl("YanilGitClean", { fg = base0B })
nvim_set_hl("YanilIndentMarker", { fg = colors.indent })

nvim_set_hl("TelescopeBorder", { fg = colors.border })
nvim_set_hl("TelescopePromptBorder", { fg = colors.border })
nvim_set_hl("TelescopeResultsBorder", { fg = colors.border })
nvim_set_hl("TelescopePreviewBorder", { fg = colors.border })

nvim_set_hl("DapUIFloatBorder", { fg = colors.border })

nvim_set_hl("DashboardHeader", { fg = colors.comment })

nvim_set_hl("ScrollView", { bg = colors.scrollbar })

nvim_set_hl("ScrollbarErrorHandle", { fg = base08 })
nvim_set_hl("ScrollbarWarnHandle", { fg = base0A })
nvim_set_hl("ScrollbarInfoHandle", { fg = base0D })
nvim_set_hl("ScrollbarHintHandle", { fg = base0B })
nvim_set_hl("ScrollbarError", { fg = base08 })
nvim_set_hl("ScrollbarWarn", { fg = base0A })
nvim_set_hl("ScrollbarInfo", { fg = base0D })
nvim_set_hl("ScrollbarHint", { fg = base0B })

nvim_set_hl("UfoPreviewThumb", { bg = colors.background, fg = base08 })
nvim_set_hl("UfoPreviewSbar", { bg = colors.background, fg = base08 })
nvim_set_hl("UfoFoldedEllipsis", { bg = colors.background, fg = base08 })

-- Conceal = { guifg = base0D, guibg = base00 },
-- Macro = { guifg = base08 },

-- QuickFixLine = { guibg = base01 },
-- WildMenu = { guifg = base00, guibg = base05 },

-- Dap-ui
-- DapUIVariable = { guibg = colors.dark_background },
-- DapUIValue = { guibg = colors.dark_background },
-- DapUIFrameName = { guibg = colors.dark_background },

-- Nvim-tree
-- NvimTreeFolderIcon = { guifg = base0D },
-- NvimTreeFolderName = { guifg = colors.white },
-- NvimTreeOpenedFolderName = { guifg = colors.white },
-- NvimTreeEmptyFolderName = { guifg = colors.white },
-- NvimTreeOpenedFile = { guifg = colors.white },
-- NvimTreeIndentMarker = { guifg = colors.indent },
-- NvimTreeVertSplit = { guifg = colors.dark_background, guibg = colors.dark_background },
-- NvimTreeStatuslineNc = { guifg = colors.dark_background, guibg = colors.dark_background, gui = 'underline' },
-- NvimTreeNormal = { guibg = colors.dark_background },
-- NvimTreeRootFolder = { guifg = colors.white, gui = 'bold' },

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
