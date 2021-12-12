vim.opt.indentexpr = 'nvim_treesitter#indent()'
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

require('cmp').setup.buffer({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
})
