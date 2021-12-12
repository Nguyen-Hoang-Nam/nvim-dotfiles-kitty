vim.opt.indentexpr = 'nvim_treesitter#indent()'

require('cmp').setup.buffer({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    },
})
