local aerial = require('aerial')

aerial.register_attach_cb(function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>t', '<cmd>AerialToggle!<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[t', '<cmd>AerialPrev<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']t', '<cmd>AerialNext<CR>', {})
end)
