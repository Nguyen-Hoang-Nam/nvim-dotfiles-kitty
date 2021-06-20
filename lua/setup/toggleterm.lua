require"toggleterm".setup{
	size = 10,
	open_mapping = [[<M-t>]],
	shade_filetypes = {},
	shade_terminals = false,
	start_in_insert = true,
	persist_size = true,
	direction = 'horizontal',
}

local Terminal = require('toggleterm.terminal').Terminal

local floatTerminal = Terminal:new({
	direction = 'float',
})

function float_terminal_toggle()
	floatTerminal:toggle()
end

vim.api.nvim_set_keymap('n', '<M-f>', '<Cmd>lua float_terminal_toggle()<CR>', {noremap = true, silent = true})

local bottomTerminal = Terminal:new({
	direction = 'horizontal',
})

function bottom_terminal_toggle()
	bottomTerminal:toggle()
end

vim.api.nvim_set_keymap('n', '<M-t>', '<Cmd>lua bottom_terminal_toggle()<CR>', {noremap = true, silent = true})
