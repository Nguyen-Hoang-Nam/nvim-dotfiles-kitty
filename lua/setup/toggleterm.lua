require('toggleterm').setup({
	size = 10,
	open_mapping = [[<M-t>]],
	shade_filetypes = {},
	shade_terminals = false,
	start_in_insert = true,
	persist_size = true,
	direction = 'float',
	float_opts = {
		border = 'curved',
		width = 100,
	},
})
