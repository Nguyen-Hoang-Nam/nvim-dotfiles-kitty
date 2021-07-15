require('bufferline').setup({
	options = {
		indicator_icon = '▌',
		modified_icon = '●',
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 16,
		diagnostics = 'nvim_lsp',
		diagnostics_indicator = function(count, _)
			return '(' .. count .. ')'
		end,
		offsets = { { filetype = 'NvimTree', text = 'File Explorer', text_align = 'left' } },
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = 'thin',
		enforce_reqular_tabs = true,
	},
})
