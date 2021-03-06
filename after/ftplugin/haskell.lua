vim.opt_local.tabstop = 2

require('cmp').setup.buffer({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
    },
})

vim.api.nvim_set_keymap('n', 'p', 'p=`]', { noremap = true })
