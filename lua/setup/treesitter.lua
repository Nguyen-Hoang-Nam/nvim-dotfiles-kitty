local treesitter_config = require('nvim-treesitter.configs')

treesitter_config.setup({
    ensure_installed = { 'javascript' },
    highlight = { enable = true, use_languagetree = true },
    rainbow = { enable = true },
    autotag = { enable = true },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<M-i>',
            node_incremental = '<Leader>k',
            node_decremental = '<Leader>j',
        },
    },
})
