setlocal tabstop=2
setlocal shiftwidth=2

lua require('cmp').setup.buffer({sources = {{name = 'nvim_lsp' }, {name = 'luasnip'}}})

set indentexpr=nvim_treesitter#indent()
