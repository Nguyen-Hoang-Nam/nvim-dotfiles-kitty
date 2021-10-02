local windline = require('windline')
local helper = require('windline.helpers')
local b_components = require('windline.components.basic')

local colors_theme = require('theme')

local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')

local hl_list = {
    Black = { 'white', 'black' },
    White = { 'black', 'white' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}

local breakpoint_width = 90
basic.divider = { b_components.divider, '' }
basic.bg = { ' ', 'StatusLine' }

basic.git_branch = {
    name = 'git_branch',
    hl_colors = {
        white = { 'white', 'black' },
    },
    text = function()
        return { { '   ' .. require('git_utils').branch(''), 'white' } }
    end,
}

basic.lsp_diagnos = {
    name = 'diagnostic',
    hl_colors = {
        red = { 'red', 'black' },
        yellow = { 'yellow', 'black' },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { '   ', '' },
                { lsp_comps.lsp_error({ format = ' %s', show_zero = true }), 'red' },
                { lsp_comps.lsp_warning({ format = '  %s', show_zero = true }), 'yellow' },
            }
        end
        return ''
    end,
}

basic.git = {
    name = 'git',
    hl_colors = {
        green = { 'green', 'black' },
        red = { 'red', 'black' },
        blue = { 'blue', 'black' },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                { '   ', '' },
                { git_comps.diff_added({ format = ' %s', show_zero = true }), 'green' },
                { git_comps.diff_changed({ format = '  %s', show_zero = true }), 'blue' },
                { git_comps.diff_removed({ format = '  %s', show_zero = true }), 'red' },
            }
        end
        return ''
    end,
}

basic.line_col = {
    name = 'file',
    hl_colors = {
        default = hl_list.Black,
        white = { 'white', 'black' },
    },
    text = function(_, _, width)
        if width > breakpoint_width then
            return {
                { b_components.line_col_lua, 'white' },
                { '  ', '' },
            }
        end
    end,
}

basic.filetype = {
    name = 'file',
    hl_colors = {
        default = hl_list.Black,
        white = { 'white', 'black' },
    },
    text = function(_, _, _)
        return {
            { vim.bo.filetype, 'white' },
            { '  ', '' },
        }
    end,
}

basic.file_right = {
    hl_colors = {
        default = hl_list.Black,
        white = { 'white', 'black' },
        magenta = { 'magenta', 'black' },
    },
    text = function(_, _, width)
        if width < breakpoint_width then
            return {
                { b_components.line_col_lua, 'white' },
                { b_components.progress_lua, '' },
            }
        end
    end,
}

local quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
        { '🚦 Quickfix ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { 'cyan', 'black_light' },
        },
        { ' Total : %L ', { 'cyan', 'black_light' } },
        { helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
        { ' ', { 'InactiveFg', 'InactiveBg' } },
        basic.divider,
        { helper.separators.slant_right, { 'InactiveBg', 'black' } },
        { '🧛 ', { 'white', 'black' } },
    },

    always_active = true,
    show_last_status = true,
}

local explorer = {
    filetypes = { 'fern', 'NvimTree', 'lir' },
    active = {
        { '  ', { 'black', 'red' } },
        { helper.separators.slant_right, { 'red', 'NormalBg' } },
        { b_components.divider, '' },
        { b_components.file_name(''), { 'white', 'NormalBg' } },
    },
    always_active = true,
    show_last_status = true,
}

local default = {
    filetypes = { 'default' },

    active = {
        basic.git_branch,
        basic.lsp_diagnos,
        basic.git,
        basic.divider,
        basic.line_col,
        basic.filetype,
    },
    inactive = {},
}

windline.setup({
    colors_name = function(colors)
        colors.red = colors_theme.red
        colors.yellow = colors_theme.yellow
        colors.green = colors_theme.green
        colors.blue = colors_theme.blue
        colors.black = colors_theme.dark_background
        return colors
    end,
    statuslines = {
        default,
        quickfix,
        explorer,
    },
})
