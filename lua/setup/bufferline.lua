local colors = require('../theme')

require('bufferline').setup({
    options = {
        indicator_icon = '▌',
        -- modified_icon = '●',
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 16,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, _)
            return '(' .. count .. ')'
        end,
        offsets = { { filetype = 'Yanil', text = 'Explorer', text_align = 'left' } },
        show_buffer_close_icons = false,
        show_close_icon = false,
        -- separator_style = 'thin',
        enforce_reqular_tabs = true,
    },

    highlights = {
        background = {
            guibg = colors.dark_background,
        },
        fill = {
            guibg = colors.dark_background,
        },
        buffer_visible = {
            guifg = colors.comment,
            guibg = colors.dark_background,
        },
        buffer_selected = {
            guifg = colors.white,
            guibg = colors.background,
            gui = 'bold',
        },
        modified = {
            guifg = colors.green,
            guibg = colors.background,
        },
        modified_visible = {
            guifg = colors.green,
            guibg = colors.dark_background,
        },
        modified_selected = {
            guifg = colors.green,
            guibg = colors.background,
        },
        error = {
            guifg = colors.red,
            guibg = colors.background,
        },
        error_visible = {
            guifg = colors.red,
            guibg = colors.dark_background,
        },
        warning = {
            guifg = colors.yellow,
            guibg = colors.background,
        },
        warning_visible = {
            guifg = colors.yellow,
            guibg = colors.dark_background,
        },
        warning_selected = {
            guifg = colors.yellow,
            guibg = colors.background,
        },
        indicator_selected = {
            guifg = colors.blue,
            guibg = colors.background,
        },
        separator = {
            guifg = colors.white,
        },
    },
})
