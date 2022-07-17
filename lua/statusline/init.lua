local api = vim.api
local fn = vim.fn

local setting_statusline = require("settings").statusline

local M = {}

local hide_left = { "help", "http", "sql" }

local left = function()
    local line = ""

    if not vim.tbl_contains(hide_left, vim.bo.filetype) then
        if setting_statusline.git_branch_enabled then
            line = line .. " " .. require("git_utils").branch("") .. "   "
        end

        -- Diagnostic
        if setting_statusline.diagnostic_enabled then
            line = line .. require("statusline.diagnostics").line()
        end

        -- Git diff
        if setting_statusline.git_diff_enabled then
            line = line .. require("statusline.git").line()
        end

        -- Test result
        if setting_statusline.test_enabled and require("statusline.test").is_test_file() then
            line = line .. require("statusline.test").line()
        end
    end

    return line
end

local right = function()
    local line = ""

    -- Line and column
    if setting_statusline.line_column_enabled then
        line = line .. "Ln %l, Col %c"
    end

    if fn.winwidth(0) > 80 then
        -- Show indent type and number of spaces
        if setting_statusline.tab_enabled then
            local tab_type = api.nvim_eval("&et") == 1 and "Spaces: " or "Tab Size: "
            local tab = api.nvim_eval("&tabstop")

            line = line .. "   " .. tab_type .. tab
        end

        -- Show type of line break
        if setting_statusline.line_break_enabled then
            line = line .. "   " .. require("statusline.linebreak").line()
        end

        -- Show format of file
        if setting_statusline.file_format_enabled then
            line = line .. "   " .. vim.bo.filetype:gsub("^%l", string.upper)
        end

        -- Show formatters and linters
        if setting_statusline.efm_enabled then
            line = line .. [[%{luaeval('require("format").formatter_status()')}]]
        end
    end

    -- Emoji at the end of status line
    if setting_statusline.emoji_enabled then
        line = line .. "   %#StatuslineSmiley#" .. setting_statusline.emoji_icon
    end

    line = line .. "  "

    return line
end

local async_load = vim.loop.new_async(vim.schedule_wrap(function()
    local line
    if fn.winwidth(0) > 30 then
        line = "%#StatuslineBackground#  "
        line = line .. left()

        line = line .. "%#StatuslineBackground#%="
        line = line .. right()
    else
        line = "%#StatuslineEmptyBackground#"
    end

    vim.wo.statusline = line
end))

local empty_statusline = { "dapui_stacks", "dapui_scopes", "aerial", "sqls_output", "toggleterm" }

function M.load()
    if vim.tbl_contains(empty_statusline, vim.bo.filetype) then
        -- vim.wo.statusline = '%#StatuslineEmptyBackground#  ' .. windowType .. '%#StatuslineEmptyBackground#'
        vim.wo.statusline = "%#StatuslineEmptyBackground#"
    else
        async_load:send()
    end
end

return M
