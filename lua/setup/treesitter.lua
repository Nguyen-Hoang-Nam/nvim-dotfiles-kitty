local treesitter_config = require('nvim-treesitter.configs')

treesitter_config.setup({
    indent = {
        enable = true,
    },

    highlight = {
        enable = true,
    },

    rainbow = {
        enable = true,
        extended_mode = false,
    },

    autotag = { enable = true },

    pairs = {
        enable = true,
        highlight_self = false,
        goto_right_end = false,
        fallback_cmd_normal = 'normal! %',
    },

    autopairs = { enable = true },
})
