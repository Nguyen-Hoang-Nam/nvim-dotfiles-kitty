require('goto-preview').setup({
    post_open_hook = function(buf)
        vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':close<CR>', { silent = true, nowait = true, noremap = true })
    end,
})
