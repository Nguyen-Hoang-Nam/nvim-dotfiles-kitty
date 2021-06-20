local compe = require('compe')
local g = vim.g

vim.o.completeopt = "menuone,noselect"

compe.setup {
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = true,
	source = {
		path = true,
		buffer = true,
		calc = false,
		vsnip = false,
		nvim_lsp = true,
		nvim_lua = true,
		spell = false,
		tags = false,
		snippets_nvim = false,
		treesitter = true
	}
}

g.loaded_compe_snippets_nvim = 0
g.loaded_compe_spell = 0
g.loaded_compe_calc = 0
g.loaded_compe_tags = 0

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col('.') - 1
	if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
		return true
	else
		return false
	end
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	elseif check_back_space() then
		return t "<Tab>"
	else
		return vim.fn['compe#complete']()
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>"
	else
		return t "<S-Tab>"
	end
end

function _G.completions()
	local npairs = require("nvim-autopairs")
	if vim.fn.pumvisible() == 1 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			return vim.fn["compe#confirm"]("<CR>")
		end
	end
	return npairs.check_break_line_char()
end

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", {expr = true})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true, silent = true})
