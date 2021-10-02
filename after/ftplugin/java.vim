setlocal tabstop=4
setlocal shiftwidth=4

lua require('cmp').setup.buffer({sources = {{name = 'nvim_lsp' }, {name = 'luasnip'}}})
lua require('lsp.jdtls').setup()
