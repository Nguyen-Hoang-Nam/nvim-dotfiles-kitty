local cmd = vim.cmd
local colors = require('theme')

local function highlight(group)
    local guifg = group.guifg or 'NONE'
    local guibg = group.guibg or 'NONE'
    local gui = group.gui or 'NONE'

    cmd(string.format('hi %s guifg=%s guibg=%s gui=%s', group.group, guifg, guibg, gui))
end

-- Misc
highlight({ group = 'Normal', guibg = colors.background })
highlight({ group = 'NormalNC', guibg = colors.background })
highlight({ group = 'NonText', guifg = colors.comment })

highlight({ group = 'CursorLine', guibg = colors.cursorLine })
highlight({ group = 'CursorLineNr', guifg = colors.yellow, guibg = colors.cursorLine })

highlight({ group = 'EndOfBuffer', guifg = colors.background })
highlight({ group = 'VertSplit', guifg = colors.border })
highlight({
    group = 'StatusLineNC',
    guifg = colors.border,
    guibg = colors.dark_background,
    gui = 'underline',
})
highlight({ group = 'LineNr', guifg = colors.lineNumber, guibg = colors.background })
highlight({ group = 'SignColumn', guibg = colors.background })

-- Popup
highlight({ group = 'Pmenusel', guibg = colors.green })
highlight({ group = 'Pmenu', guibg = colors.dark_background })

highlight({ group = 'IndentBlanklineContextChar', guifg = colors.yellow })

highlight({ group = 'StatuslineBackground', guibg = colors.dark_background })
highlight({ group = 'StatuslineDiagnosticsError', guifg = colors.red, guibg = colors.dark_background })
highlight({ group = 'StatuslineDiagnosticsWarning', guifg = colors.yellow, guibg = colors.dark_background })
highlight({ group = 'StatuslineDiffAdded', guifg = colors.green, guibg = colors.dark_background })
highlight({ group = 'StatuslineDiffModified', guifg = colors.blue, guibg = colors.dark_background })
highlight({ group = 'StatuslineDiffRemoved', guifg = colors.red, guibg = colors.dark_background })
highlight({ group = 'StatuslineSmiley', guifg = colors.yellow, guibg = colors.dark_background })

-- GitSign
highlight({ group = 'GitSignsAdd', guifg = colors.green, guibg = colors.background })
highlight({ group = 'GitSignsChange', guifg = colors.blue, guibg = colors.background })
highlight({ group = 'GitSignsDelete', guifg = colors.red, guibg = colors.background })

highlight({ group = 'TroubleNormal', guibg = colors.dark_background })

-- Lsp
highlight({ group = 'LspDiagnosticsSignError', guifg = colors.red })
highlight({ group = 'LspDiagnosticsSignWarning', guifg = colors.yellow })
highlight({ group = 'LspDiagnosticsSignHint', guifg = colors.blue })
highlight({ group = 'LspDiagnosticsSignInformation', guifg = colors.green })

highlight({ group = 'LspDiagnosticsVirtualTextError', guifg = colors.red })
highlight({ group = 'LspDiagnosticsVirtualTextWarning', guifg = colors.yellow })
highlight({ group = 'LspDiagnosticsVirtualTextHint', guifg = colors.blue })
highlight({ group = 'LspDiagnosticsVirtualTextInformation', guifg = colors.green })

highlight({ group = 'LspDiagnosticsUnderlineError', gui = 'undercurl', guisp = colors.red })
highlight({ group = 'LspDiagnosticsUnderlineWarning', gui = 'undercurl', guisp = colors.yellow })
highlight({ group = 'LspDiagnosticsUnderlineHint', gui = 'undercurl', guisp = colors.blue })
highlight({ group = 'LspDiagnosticsUnderlineInformation', gui = 'undercurl', guisp = colors.green })

-- Tree
highlight({ group = 'NvimTreeFolderIcon', guifg = colors.blue })
highlight({ group = 'NvimTreeFolderName', guifg = colors.white })
highlight({ group = 'NvimTreeOpenedFolderName', guifg = colors.white })
highlight({ group = 'NvimTreeEmptyFolderName', guifg = colors.white })
highlight({ group = 'NvimTreeOpenedFile', guifg = colors.white })
highlight({ group = 'NvimTreeIndentMarker', guifg = colors.indent })
highlight({ group = 'NvimTreeVertSplit', guifg = colors.dark_background, guibg = colors.dark_background })
highlight({
    group = 'NvimTreeStatuslineNc',
    guifg = colors.dark_background,
    guibg = colors.dark_background,
    gui = 'underline',
})
highlight({ group = 'NvimTreeNormal', guibg = colors.dark_background })
highlight({ group = 'NvimTreeRootFolder', guifg = colors.white, gui = 'bold' })

-- Telescope
highlight({ group = 'TelescopeBorder', guifg = colors.border })
highlight({ group = 'TelescopePromptBorder', guifg = colors.border })
highlight({ group = 'TelescopeResultsBorder', guifg = colors.border })
highlight({ group = 'TelescopePreviewBorder', guifg = colors.border })
-- highlight({ group = 'TelescopeNormal', guibg = colors.dark_background })

-- Dashboard
highlight({ group = 'DashboardHeader', guifg = colors.comment })
highlight({ group = 'DashboardCenter', guifg = colors.comment })
highlight({ group = 'DashboardShortcut', guifg = colors.comment })

-- ScrollView
highlight({ group = 'ScrollView', guibg = colors.scrollbar })

highlight({ group = 'NormalFloat', guibg = colors.dark_background })
