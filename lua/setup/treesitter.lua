local treesitter_config = require('nvim-treesitter.configs')

treesitter_config.setup({
    -- ensure_installed = { 'javascript' },
    highlight = {
        enable = true,
        -- use_languagetree = true,
    },
    rainbow = {
        enable = true,
        extended_mode = false,
    },
    autotag = { enable = true },
    indent = {
        enable = true,
    },
    pairs = {
        enable = true,
        highlight_self = false,
        goto_right_end = false,
        fallback_cmd_normal = 'normal! %',
        keymaps = {
            goto_partner = '<Leader>;',
        },
    },
})
