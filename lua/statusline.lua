local M = {}

local function get_nvim_lsp_diagnostic(severity)
    if next(vim.lsp.buf_get_clients(0)) == nil then
        return '0 '
    end

    return #vim.diagnostic.get(vim.api.nvim_get_current_buf(), { severity = severity }) .. ' '
end

function M.diagnostics_error()
    return get_nvim_lsp_diagnostic(vim.diagnostic.severity.ERROR)
end

function M.diagnostics_warning()
    return get_nvim_lsp_diagnostic(vim.diagnostic.severity.WARN)
end

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_vcs.lua
function M.get_hunks_data()
    -- diff data 1:add 2:modified 3:remove
    local diff_data = { 0, 0, 0 }
    if vim.fn.exists('b:gitsigns_status') == 1 then
        local gitsigns_dict = vim.api.nvim_buf_get_var(0, 'gitsigns_status')
        diff_data[1] = tonumber(gitsigns_dict:match('+(%d+)')) or 0
        diff_data[2] = tonumber(gitsigns_dict:match('~(%d+)')) or 0
        diff_data[3] = tonumber(gitsigns_dict:match('-(%d+)')) or 0
    end

    return diff_data
end

local async_load = vim.loop.new_async(vim.schedule_wrap(function()
    local line
    if vim.fn.winwidth(0) > 30 then
        local fileType = vim.bo.filetype
        local lineBreak = vim.api.nvim_eval('&fileformat')
        local is_update = false
        local tab = vim.api.nvim_eval('&tabstop')

        if fileType ~= '' and fileType ~= 'toggleterm' then
            is_update = true

            fileType = fileType:gsub('^%l', string.upper)

            if lineBreak == 'unix' then
                lineBreak = 'LF'
            elseif lineBreak == 'mac' then
                lineBreak = 'CR'
            else
                lineBreak = 'CRLF'
            end
        else
            is_update = false
        end

        line = ''

        if fileType ~= 'Help' then
            line = line
                .. '%#StatuslineBackground#   '
                .. require('git_utils').branch('')
                .. '   %#StatuslineDiagnosticsError#'
                .. [[ %{luaeval('require("statusline").diagnostics_error()')}]]
                .. '%#StatuslineDiagnosticsWarning#'
                .. [[ %{luaeval('require("statusline").diagnostics_warning()')}]]
                .. '  %#StatuslineDiffAdded#'
                .. [[ %{luaeval('require("statusline").get_hunks_data()[1]')}]]
                .. ' %#StatuslineDiffModified#'
                .. [[ %{luaeval('require("statusline").get_hunks_data()[2]')}]]
                .. ' %#StatuslineDiffRemoved#'
                .. [[ %{luaeval('require("statusline").get_hunks_data()[3]')}]]
        end

        line = line .. '%#StatuslineBackground#%=ln %l, col %c   '

        if is_update and vim.fn.winwidth(0) > 80 then
            line = line
                .. 'Tabsizes '
                .. tab
                .. '   '
                .. lineBreak
                .. '   '
                .. fileType
                .. [[   %{luaeval('require("format").formatter_status()')}]]
        end

        line = line .. '%#StatuslineSmiley#  '
    else
        line = '%#StatuslineBackground#'
    end

    vim.wo.statusline = line
end))

function M.load()
    local fileType = vim.bo.filetype
    if fileType == 'dapui_watches' or fileType == 'dapui_stacks' or fileType == 'dapui_scopes' then
        local windowType
        if fileType == 'dapui_watches' then
            windowType = 'Watches'
        elseif fileType == 'dapui_stacks' then
            windowType = 'Stacks'
        elseif fileType == 'dapui_scopes' then
            windowType = 'Scopes'
        end

        vim.wo.statusline = '%#StatuslineBackground#  ' .. windowType .. '%#StatuslineBackground#'
    else
        async_load:send()
    end
end

return M
