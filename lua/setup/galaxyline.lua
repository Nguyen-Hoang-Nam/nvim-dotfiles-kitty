local galaxyline = require('galaxyline')
local gls = galaxyline.section
local icons = require('nvim-nonicons')
galaxyline.short_line_list = { 'LuaTree', 'vista', 'dbui' }

local colors = require('theme').colors
local global = require('global')

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

local function get_nvim_lsp_diagnostic(diag_type)
    if next(vim.lsp.buf_get_clients(0)) == nil then
        return '0 '
    end
    local active_clients = vim.lsp.get_active_clients()

    if active_clients then
        local count = 0

        for _, client in ipairs(active_clients) do
            count = count + vim.lsp.diagnostic.get_count(vim.api.nvim_get_current_buf(), diag_type, client.id)
        end

        return count .. ' '
    end
end

local function get_hunks_data()
    -- diff data 1:add 2:modified 3:remove
    local diff_data = { 0, 0, 0 }
    if vim.fn.exists('*GitGutterGetHunkSummary') == 1 then
        for idx, v in pairs(vim.fn.GitGutterGetHunkSummary()) do
            diff_data[idx] = v
        end
        return diff_data
    elseif vim.fn.exists('*sy#repo#get_stats') == 1 then
        diff_data[1] = vim.fn['sy#repo#get_stats']()[1]
        diff_data[2] = vim.fn['sy#repo#get_stats']()[2]
        diff_data[3] = vim.fn['sy#repo#get_stats']()[3]
        return diff_data
    elseif vim.fn.exists('b:gitsigns_status') == 1 then
        local gitsigns_dict = vim.api.nvim_buf_get_var(0, 'gitsigns_status')
        diff_data[1] = tonumber(gitsigns_dict:match('+(%d+)')) or 0
        diff_data[2] = tonumber(gitsigns_dict:match('~(%d+)')) or 0
        diff_data[3] = tonumber(gitsigns_dict:match('-(%d+)')) or 0
    end
    return diff_data
end

gls.left[1] = {
    Git_Branch = {
        provider = 'GitBranch',
        condition = checkwidth,
        highlight = { '#FFFFFF', colors.dark_background },
        separator = '  ',
        separator_highlight = { 'NONE', colors.dark_background },
        -- icon = '    ',
        icon = '   ' .. icons.get('git-branch') .. ' ',
    },
}

gls.left[2] = {
    Diagnostic_Error = {
        provider = function()
            if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
                return get_nvim_lsp_diagnostic('Error')
            end

            return '0 '
        end,
        condition = checkwidth,
        -- icon = '  ',
        icon = ' ' .. icons.get('x-circle') .. ' ',
        highlight = { colors.red, colors.dark_background },
    },
}

gls.left[3] = {
    Diagnostic_Warn = {
        provider = function()
            if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
                return get_nvim_lsp_diagnostic('Warning')
            end

            return '0 '
        end,
        condition = checkwidth,
        -- icon = '  ',
        icon = ' ' .. icons.get('alert') .. ' ',
        highlight = { colors.yellow, colors.dark_background },
    },
}

gls.left[4] = {
    Diff_Add = {
        provider = function()
            local add = get_hunks_data()[1]
            return add .. ' '
        end,
        condition = checkwidth,
        -- icon = '    ',
        icon = '   ' .. icons.get('diff-added') .. ' ',
        highlight = { colors.green, colors.dark_background },
    },
}

gls.left[5] = {
    Diff_Modified = {
        provider = function()
            local modified = get_hunks_data()[2]
            return modified .. ' '
        end,
        condition = checkwidth,
        -- icon = ' ',
        icon = icons.get('diff-modified') .. ' ',
        highlight = { colors.blue, colors.dark_background },
    },
}

gls.left[6] = {
    Diff_Remove = {
        provider = function()
            local removed = get_hunks_data()[3]
            return removed .. ' '
        end,
        condition = checkwidth,
        -- icon = ' ',
        icon = icons.get('diff-removed') .. ' ',
        highlight = { colors.red, colors.dark_background },
    },
}

gls.left[7] = {
    Separator_9 = {
        provider = function()
            return ' '
        end,
        highlight = { '#3E4451', colors.dark_background, 'underline' },
        condition = function()
            return not checkwidth()
        end,
    },
}

gls.right[1] = {
    Line_Col = {
        provider = function()
            local line = vim.fn.line('.')
            local column = vim.fn.col('.')
            return string.format('Ln %d, Col %d   ', line, column)
        end,
        condition = checkwidth,
        highlight = { '#FFFFFF', colors.dark_background },
    },
}

gls.right[2] = {
    Tab_Size = {
        provider = function()
            -- local tabstop = vim.api.nvim_eval('&tabstop')
            return string.format('Tabsize %d   ', global.tab)
        end,
        condition = checkwidth,
        highlight = { '#FFFFFF', colors.dark_background },
    },
}

gls.right[3] = {
    Line_Break = {
        provider = function()
            return global.lineBreak
        end,
        condition = checkwidth,
        highlight = { '#FFFFFF', colors.dark_background },
    },
}

gls.right[4] = {
    Language = {
        provider = function()
            return global.fileType
        end,
        condition = checkwidth,
        highlight = { '#FFFFFF', colors.dark_background },
    },
}

gls.right[5] = {
    Formatter = {
        provider = function()
            return global.format
        end,
        condition = checkwidth,
        highlight = { '#FFFFFF', colors.dark_background },
    },
}

gls.right[6] = {
    Icon = {
        provider = function()
            -- return ' 🥑  '

            return ' ' .. icons.get('smiley') .. '  '
        end,
        highlight = function()
            if checkwidth() then
                return { colors.yellow, colors.dark_background, 'NONE' }
            end

            return { '#3E4451', colors.dark_background, 'underline' }
        end,
    },
}
