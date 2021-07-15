-- local Rule = require('nvim-autopairs.rule')
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ''
MUtils.completion_confirm = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info()['selected'] ~= -1 then
			return vim.fn['compe#confirm'](npairs.esc('<cr>'))
		else
			return npairs.esc('<cr>')
		end
	else
		return npairs.autopairs_cr()
	end
end

require('nvim-autopairs.completion.compe').setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` after select function or method item
})

remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { 'string' }, -- it will not add pair on that treesitter node
		javascript = { 'template_string' },
		java = false, -- don't check treesitter on java
	},
})

require('nvim-treesitter.configs').setup({
	autopairs = { enable = true },
})

-- local ts_conds = require('nvim-autopairs.ts-conds')
