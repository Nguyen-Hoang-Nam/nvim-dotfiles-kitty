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
    },

    autopairs = { enable = true },

    textobjects = {
        move = {
            enable = true,
            set_jumps = true,

            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },

            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },

            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },

            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },

        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ['df'] = '@function.outer',
                ['dF'] = '@class.outer',
            },
        },
    },
})
