local galaxyline = require('galaxyline')
local gls = galaxyline.section
local vcs = require 'galaxyline.provider_vcs'
galaxyline.short_line_list = {"LuaTree", "vista", "dbui"}

local colors = {
	bg = "#212835",
	dark_bg = "#1B212C",
	line_bg = "#282c34",
	fg = "#D8DEE9",
	fg_green = "#36C692",
	yellow = "#E3C78A",
	cyan = "#79DAC8",
	darkblue = "#61afef",
	green = "#8CC85F",
	orange = "#FF8800",
	purple = "#D183E8",
	magenta = "#c678dd",
	blue = "#80A0FF",
	red = "#FF5454",
	lightbg = "#3C4048",
	nord = "#81A1C1",
	greenYel = "#EBCB8B"
}

local checkwidth = function()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 40 then
		return true
	end
	return false
end

local function get_nvim_lsp_diagnostic(diag_type)
	if next(vim.lsp.buf_get_clients(0)) == nil then return '' end
	local active_clients = vim.lsp.get_active_clients()

	if active_clients then
		local count = 0

		for _, client in ipairs(active_clients) do
			count = count + vim.lsp.diagnostic.get_count(vim.api.nvim_get_current_buf(),diag_type,client.id)
		end

		if count ~= 0 then return count .. ' ' end
	end
end

gls.left[1] = {
	Git_Branch = {
		provider = 'GitBranch',
		condition = checkwidth,
		highlight = {'#FFFFFF', colors.dark_bg},
		separator = '  ',
		separator_highlight = {'#FFFFFF', colors.dark_bg},
		icon = '    ',
	}
}

gls.left[2] = {
	Diagnostic_Error = {
		provider = function()
			if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
				return get_nvim_lsp_diagnostic('Error')
			end

			return '0'
		end,
		condition = checkwidth,
		icon = "  ",
		highlight = {colors.red, colors.dark_bg}
	}
}

gls.left[3] = {
	Separator_7 = {
		provider = function()
			return " "
		end,
		condition = checkwidth,
		highlight = {'NONE', colors.dark_bg}
	}
}

gls.left[4] = {
	Diagnostic_Warn = {
		provider = function()
			if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
				return get_nvim_lsp_diagnostic('Warning')
			end

			return '0'
		end,
		condition = checkwidth,
		icon = "  ",
		highlight = {colors.blue, colors.dark_bg}
	}
}

gls.left[5] = {
	Separator_5 = {
		provider = function()
			return '   '
		end,
		condition = checkwidth,
		separator_highlight = {colors.line_bg, 'NONE'},
		highlight = {colors.line_bg, colors.dark_bg}
	}
}

gls.left[6] = {
	Diff_Add = {
		provider = "DiffAdd",
		condition = checkwidth,
		icon = "   ",
		highlight = {colors.greenYel, colors.dark_bg}
	}
}

gls.left[7] = {
	Diff_Modified = {
		provider = "DiffModified",
		condition = checkwidth,
		icon = " ",
		highlight = {colors.orange, colors.dark_bg}
	}
}

gls.left[8] = {
	Diff_Remove = {
		provider = "DiffRemove",
		condition = checkwidth,
		icon = " ",
		highlight = {colors.red, colors.dark_bg}
	}
}

gls.left[9] = {
	Separator_9 = {
		provider = function()
			return ' '
		end,
		highlight = {'#3E4451', colors.dark_bg , 'underline'},
		condition = function()
			return not checkwidth()
		end
	}
}

gls.right[1] = {
	Line_Col = {
		provider = function()
			local line = vim.fn.line('.')
			local column = vim.fn.col('.')
			return string.format("Ln %d, Col %d", line, column)
		end,
		condition = checkwidth,
		highlight = {'#FFFFFF', colors.dark_bg}
	}
}

gls.right[2] = {
	Separator_Right_2 = {
		provider = function()
			return '    '
		end,
		condition = checkwidth,
		highlight = {'#FFFFFF', colors.dark_bg}
	}
}

gls.right[3] = {
	Tab_Size = {
		provider = function()
			local tabstop = vim.api.nvim_eval('&tabstop')
			return string.format("Tabsize %d", tabstop)
		end,
		condition = checkwidth,
		highlight = {'#FFFFFF', colors.dark_bg}
	}
}

gls.right[4] = {
	Separator_Right_4 = {
		provider = function()
			return '    '
		end,
		condition = checkwidth,
		highlight = {'#FFFFFF', colors.dark_bg}
	}
}

gls.right[5] = {
	Language = {
		provider = function()
			return vim.bo.filetype:gsub('^%l', string.upper)
		end,
		condition = checkwidth,
		highlight = {'#FFFFFF', colors.dark_bg}
	}
}

gls.right[6] = {
	Icon = {
		provider = function()
			return '    🥑  '
		end,
		highlight = function()
			if checkwidth() then
				return {'#FFFFFF', colors.dark_bg, 'NONE'}
			end

			return {'#3E4451', colors.dark_bg, 'underline'}
		end
	}
}
