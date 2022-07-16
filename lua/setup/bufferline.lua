local colors = require("settings").colors
local sidebar = require("sidebar")

require("bufferline").setup({
    options = {
        indicator_icon = "▌",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, _)
            return "(" .. count .. ")"
        end,
        offsets = sidebar.sidebar_title,
        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_reqular_tabs = true,
        custom_filter = function(buf_number, _)
            if vim.fn.bufname(buf_number) ~= "[no name].sql" then
                return true
            end
        end,
    },

    highlights = {
        fill = {
            guibg = colors.dark_background,
        },
        background = {
            guibg = colors.dark_background,
        },

        tab = {
            guifg = colors.comment,
            guibg = colors.dark_background,
        },
        tab_selected = {
            guifg = colors.white,
            guibg = colors.background,
            gui = "bold",
        },

        buffer_visible = {
            guifg = colors.comment,
            guibg = colors.dark_background,
        },
        buffer_selected = {
            guifg = colors.white,
            guibg = colors.background,
            gui = "bold",
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
        error_selected = {
            guifg = colors.red,
            guibg = colors.background,
        },

        error_diagnostic = {
            guifg = colors.red,
            guibg = colors.background,
        },
        error_diagnostic_visible = {
            guifg = colors.red,
            guibg = colors.dark_background,
        },
        error_diagnostic_selected = {
            guifg = colors.red,
            guibg = colors.background,
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

        warning_diagnostic = {
            guifg = colors.yellow,
            guibg = colors.background,
        },
        warning_diagnostic_visible = {
            guifg = colors.yellow,
            guibg = colors.dark_background,
        },
        warning_diagnostic_selected = {
            guifg = colors.yellow,
            guibg = colors.background,
        },

        info = {
            guifg = colors.green,
            guibg = colors.background,
        },
        info_visible = {
            guifg = colors.green,
            guibg = colors.dark_background,
        },
        info_selected = {
            guifg = colors.green,
            guibg = colors.background,
        },

        info_diagnostic = {
            guifg = colors.green,
            guibg = colors.background,
        },
        info_diagnostic_visible = {
            guifg = colors.green,
            guibg = colors.dark_background,
        },
        info_diagnostic_selected = {
            guifg = colors.green,
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
