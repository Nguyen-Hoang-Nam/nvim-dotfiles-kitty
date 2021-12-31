local treesitter_config = require('nvim-treesitter.configs')

treesitter_config.setup({
    highlight = {
        enable = true,
    },

    rainbow = {
        enable = true,
        extended_mode = false,
    },

    autotag = { enable = true },

    autopairs = { enable = true },
})
