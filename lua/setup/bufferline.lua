local bufferline = require('bufferline')
vim.o.termguicolors = true

local colors = require 'theme/onedark'.colors

bufferline.setup {
	options = {
		numbers = "buffer_id",
		left_trunc_marker = '|',
		right_trunc_marker = '|',
		number_style = "",
		modified_icon = "●",
		close_icon = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 16,
		enforce_reqular_tabs = true,
		view = "multiwindow",
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = "thin",
		diagnostics = 'nvim_lsp',
		diagnostics_indicator = function(count, level)
			return "("..count..")"
		end
	},
	highlights = {
		background = {
			guibg = colors.dark_background,
		},
		fill = {
			guibg = colors.dark_background,
		},
		buffer_visible = {
			guifg = '#9DA5B4',
			guibg = colors.dark_background
		},
		buffer_selected = {
			guifg = '#FFFFFF',
			guibg = colors.background,
			gui = 'bold'
		},
		separator_visible = {
			guifg = '#565C64',
			guibg = colors.dark_background,
		},
		separator_selected = {
			guifg = '#1F212A',
			guibg = colors.dark_background,
		},
		separator = {
			guifg = '#000000',
			guibg = colors.dark_background,
		},
		indicator_selected = {
			guifg = '#1F212A',
			guibg = '#1F212A'
		},
		modified_selected = {
			guifg = '#85DC85',
			guibg = '#282B34'
		},
		error = {
			guifg = '#ff5454',
			guibg = '#1F212A'
		},
		error_visible = {
			guifg = '#ff5454',
			guibg = '#1F212A'
		},
		error_selected = {
			guifg = '#ff5454',
			guibg = '#282B34'
		},
		warning = {
			guifg = '#e4c88b',
			guibg = '#282B34',
			gui = 'underline'
		},
		warning_selected = {
			guifg = '#E4C88B',
			guibg = '#282B34'
		},
		warning_visible = {
			guifg = '#E4C88B',
			guibg = '#1F212A'
		},
		modified = {
			guifg = '#85dc85',
			guibg = '#1F212A'
		},
		modified_visible = {
			guifg = '#85dc85',
			guibg = '#1F212A'
		}
	}
}
