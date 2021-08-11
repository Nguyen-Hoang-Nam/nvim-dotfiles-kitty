-- local cmd = vim.cmd
-- local colors = require('theme')

-- local function highlight(group)
--     local guifg = group.guifg or 'NONE'
--     local guibg = group.guibg or 'NONE'
--     local gui = group.gui or 'NONE'

--     cmd(string.format('hi %s guifg=%s guibg=%s gui=%s', group.group, guifg, guibg, gui))
-- end

-- highlight({ group = 'IndentBlanklineContextChar', guifg = colors.yellow })

-- highlight({ group = 'StatuslineBackground', guibg = colors.dark_background })
-- highlight({ group = 'StatuslineDiagnosticsError', guifg = colors.red, guibg = colors.dark_background })
-- highlight({ group = 'StatuslineDiagnosticsWarning', guifg = colors.yellow, guibg = colors.dark_background })
-- highlight({ group = 'StatuslineDiffAdded', guifg = colors.green, guibg = colors.dark_background })
-- highlight({ group = 'StatuslineDiffModified', guifg = colors.blue, guibg = colors.dark_background })
-- highlight({ group = 'StatuslineDiffRemoved', guifg = colors.red, guibg = colors.dark_background })
-- highlight({ group = 'StatuslineSmiley', guifg = colors.yellow, guibg = colors.dark_background })

-- GitSign
-- highlight({ group = 'GitSignsAdd', guifg = colors.green, guibg = colors.background })
-- highlight({ group = 'GitSignsChange', guifg = colors.blue, guibg = colors.background })
-- highlight({ group = 'GitSignsDelete', guifg = colors.red, guibg = colors.background })

-- highlight({ group = 'TroubleNormal', guibg = colors.dark_background })

-- Tree
-- highlight({ group = 'NvimTreeFolderIcon', guifg = colors.blue })
-- highlight({ group = 'NvimTreeFolderName', guifg = colors.white })
-- highlight({ group = 'NvimTreeOpenedFolderName', guifg = colors.white })
-- highlight({ group = 'NvimTreeEmptyFolderName', guifg = colors.white })
-- highlight({ group = 'NvimTreeOpenedFile', guifg = colors.white })
-- highlight({ group = 'NvimTreeIndentMarker', guifg = colors.indent })
-- highlight({ group = 'NvimTreeVertSplit', guifg = colors.dark_background, guibg = colors.dark_background })
-- highlight({
--     group = 'NvimTreeStatuslineNc',
--     guifg = colors.dark_background,
--     guibg = colors.dark_background,
--     gui = 'underline',
-- })
-- highlight({ group = 'NvimTreeNormal', guibg = colors.dark_background })
-- highlight({ group = 'NvimTreeRootFolder', guifg = colors.white, gui = 'bold' })

-- Telescope
-- highlight({ group = 'TelescopeBorder', guifg = colors.border })
-- highlight({ group = 'TelescopePromptBorder', guifg = colors.border })
-- highlight({ group = 'TelescopeResultsBorder', guifg = colors.border })
-- highlight({ group = 'TelescopePreviewBorder', guifg = colors.border })
-- highlight({ group = 'TelescopeNormal', guibg = colors.dark_background })

-- Dashboard
-- highlight({ group = 'DashboardHeader', guifg = colors.comment })
-- highlight({ group = 'DashboardCenter', guifg = colors.comment })
-- highlight({ group = 'DashboardShortcut', guifg = colors.comment })

-- ScrollView
-- highlight({ group = 'ScrollView', guibg = colors.scrollbar })

-- highlight({ group = 'NormalFloat', guibg = colors.dark_background })
