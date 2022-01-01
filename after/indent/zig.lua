vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

vim.opt_local.comments = ':///,://!,://,:\\\\'
vim.opt_local.commentstring = '// %s'

vim.opt_local.cindent = true

vim.opt_local.cinoptions = 'L0,m1,(s,j1,J1,l1'

require('cmp').setup.buffer({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
})
