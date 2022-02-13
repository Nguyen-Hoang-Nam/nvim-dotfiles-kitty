vim.opt_local.spell = true
vim.opt_local.colorcolumn = '80'
vim.opt.indentexpr = 'nvim_treesitter#indent()'

require('cmp').setup.buffer({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    },
})
