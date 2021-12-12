vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

require('cmp').setup.buffer({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
})

require('lsp.jdtls').setup()
