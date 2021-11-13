setlocal autoindent
setlocal smartindent

if has('comments')
    setlocal comments=:///,://!,://,:\\\\
    setlocal commentstring=//\ %s
endif

setlocal cindent
setlocal cinoptions=L0,m1,(s,j1,J1,l1

lua require('cmp').setup.buffer({sources = {{name = 'nvim_lsp' }, {name = 'luasnip'}}})
