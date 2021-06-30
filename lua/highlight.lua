local cmd = vim.cmd
local colors = require('theme/onedark').colors

local function highlight(group)
	guifg = group.guifg or 'NONE'
	guibg = group.guibg or 'NONE'
	gui = group.gui or 'NONE'

	cmd(string.format('hi %s guifg=%s guibg=%s gui=%s', group.group, guifg, guibg, gui))
end

-- Misc
highlight({ group = 'Normal', guibg = colors.background })
highlight({ group = 'NormalNC', guibg = colors.background })
highlight({ group = 'CursorLine', guibg = '#2C313A' })
highlight({ group = 'EndOfBuffer', guifg = colors.background })
highlight({ group = 'VertSplit', guifg = '#3E4451' })
highlight({
	group = 'StatusLineNC',
	guifg = '#3E4451',
	guibg = colors.dark_background,
	gui = 'underline',
})
highlight({ group = 'LineNr', guifg = '#636D83', guibg = colors.background })
highlight({ group = 'SignColumn', guibg = colors.background })

-- Popup
highlight({ group = 'Pmenusel', guibg = '#85DC85' })
highlight({ group = 'Pmenu', guibg = '#353B45' })

-- GitSign
highlight({ group = 'GitSignsAdd', guifg = '#85DC85', guibg = colors.background })
highlight({ group = 'GitSignsChange', guifg = '#61AFEF', guibg = colors.background })
highlight({ group = 'GitSignsDelete', guifg = '#D47D85', guibg = colors.background })

-- Tree
highlight({ group = 'NvimTreeFolderIcon', guifg = '#61AFEF' })
highlight({ group = 'NvimTreeFolderName', guifg = '#FFFFFF' })
highlight({ group = 'NvimTreeOpenedFolderName', guifg = '#FFFFFF' })
highlight({ group = 'NvimTreeEmptyFolderName', guifg = '#FFFFFF' })
highlight({ group = 'NvimTreeOpenedFile', guifg = '#FFFFFF' })
highlight({ group = 'NvimTreeIndentMarker', guifg = '#383C44' })
highlight({ group = 'NvimTreeVertSplit', guifg = colors.dark_background, guibg = colors.dark_background })
highlight({
	group = 'NvimTreeStatuslineNc',
	guifg = colors.dark_background,
	guibg = colors.dark_background,
	gui = 'underline',
})
highlight({ group = 'NvimTreeNormal', guibg = colors.dark_background })
highlight({ group = 'NvimTreeRootFolder', guifg = colors.dark_background })

-- Telescope
highlight({ group = 'TelescopeBorder', guifg = '#525865' })
highlight({ group = 'TelescopePromptBorder', guifg = '#525865' })
highlight({ group = 'TelescopeResultsBorder', guifg = '#525865' })
highlight({ group = 'TelescopePreviewBorder', guifg = '#525865' })

-- Dashboard
highlight({ group = 'DashboardCenter', guifg = '#565C64' })
highlight({ group = 'DashboardShortcut', guifg = '#565C64' })

-- ScrollView
highlight({ group = 'ScrollView', guibg = '#4E5666' })

highlight({ group = 'NormalFloat', guibg = colors.dark_background })
-- highlight {group = 'FloatBorder', guibg = '#525865'}
