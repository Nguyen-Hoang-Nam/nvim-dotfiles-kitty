vim.opt_local.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.indentexpr = 'nvim_treesitter#indent()'

require('cmp').setup.buffer({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
})
