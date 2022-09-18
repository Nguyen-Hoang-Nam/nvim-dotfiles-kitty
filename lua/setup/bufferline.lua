local colors = require("settings").colors
local sidebar = require("sidebar")

require("bufferline").setup({
    options = {
        indicator = {
            icon = "▌",
            stayle = "icon",
        },
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
            bg = colors.dark_background,
        },
        background = {
            bg = colors.dark_background,
        },

        tab = {
            fg = colors.comment,
            bg = colors.dark_background,
        },
        tab_selected = {
            fg = colors.white,
            bg = colors.background,
            bold = true,
        },

        buffer_visible = {
            fg = colors.comment,
            bg = colors.dark_background,
        },
        buffer_selected = {
            fg = colors.white,
            bg = colors.background,
            bold = true,
        },

        modified = {
            fg = colors.green,
            bg = colors.background,
        },
        modified_visible = {
            fg = colors.green,
            bg = colors.dark_background,
        },
        modified_selected = {
            fg = colors.green,
            bg = colors.background,
        },

        error = {
            fg = colors.red,
            bg = colors.background,
        },
        error_visible = {
            fg = colors.red,
            bg = colors.dark_background,
        },
        error_selected = {
            fg = colors.red,
            bg = colors.background,
        },

        error_diagnostic = {
            fg = colors.red,
            bg = colors.background,
        },
        error_diagnostic_visible = {
            fg = colors.red,
            bg = colors.dark_background,
        },
        error_diagnostic_selected = {
            fg = colors.red,
            bg = colors.background,
        },

        warning = {
            fg = colors.yellow,
            bg = colors.background,
        },
        warning_visible = {
            fg = colors.yellow,
            bg = colors.dark_background,
        },
        warning_selected = {
            fg = colors.yellow,
            bg = colors.background,
        },

        warning_diagnostic = {
            fg = colors.yellow,
            bg = colors.background,
        },
        warning_diagnostic_visible = {
            fg = colors.yellow,
            bg = colors.dark_background,
        },
        warning_diagnostic_selected = {
            fg = colors.yellow,
            bg = colors.background,
        },

        info = {
            fg = colors.green,
            bg = colors.background,
        },
        info_visible = {
            fg = colors.green,
            bg = colors.dark_background,
        },
        info_selected = {
            fg = colors.green,
            bg = colors.background,
        },

        info_diagnostic = {
            fg = colors.green,
            bg = colors.background,
        },
        info_diagnostic_visible = {
            fg = colors.green,
            bg = colors.dark_background,
        },
        info_diagnostic_selected = {
            fg = colors.green,
            bg = colors.background,
        },

        indicator_selected = {
            fg = colors.blue,
            bg = colors.background,
        },

        separator = {
            fg = colors.white,
        },
    },
})
