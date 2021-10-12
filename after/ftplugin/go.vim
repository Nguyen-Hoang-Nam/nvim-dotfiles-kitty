setlocal tabstop=4
setlocal noet

lua require('cmp').setup.buffer({sources = {{name = 'nvim_lsp' }, {name = 'luasnip'}}})

set indentexpr=nvim_treesitter#indent()
