" setlocal indentexpr =
setlocal autoindent
setlocal smartindent

lua require('cmp').setup.buffer({sources = {{name = 'nvim_lsp' }, {name = 'luasnip'}}})
