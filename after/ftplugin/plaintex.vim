setlocal tabstop=2
setlocal shiftwidth=2

set indentexpr=nvim_treesitter#indent()

lua require('cmp').setup.buffer({sources = {{name = 'nvim_lsp' }, {name = 'luasnip'}}})
