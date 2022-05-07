vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = false
vim.opt.indentexpr = 'nvim_treesitter#indent()'

require('cmp').setup.buffer({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
    },
})
