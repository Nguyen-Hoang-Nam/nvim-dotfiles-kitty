local global = require('global')

local M = {}

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_vcs.lua
local function parent_pathname(path)
    local i = path:find('[\\/:][^\\/:]*$')
    if not i then
        return
    end
    return path:sub(1, i - 1)
end

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_vcs.lua
local function get_git_dir(path)
    -- Checks if provided directory contains git directory
    local function has_git_dir(dir)
        local git_dir = dir .. '/.git'
        if vim.fn.isdirectory(git_dir) == 1 then
            return git_dir
        end
    end

    -- Get git directory from git file if present
    local function has_git_file(dir)
        local gitfile = io.open(dir .. '/.git')
        if gitfile ~= nil then
            local git_dir = gitfile:read():match('gitdir: (.*)')
            gitfile:close()

            return git_dir
        end
    end

    -- Check if git directory is absolute path or a relative
    local function is_path_absolute(dir)
        local patterns = {
            '^/', -- unix
            '^%a:[/\\]', -- windows
        }
        for _, pattern in ipairs(patterns) do
            if string.find(dir, pattern) then
                return true
            end
        end
        return false
    end

    -- If path nil or '.' get the absolute path to current directory
    -- if not path or path == '.' then
    --     path = vim.fn.getcwd()
    -- end

    local git_dir
    -- Check in each path for a git directory, continues until found or reached
    -- root directory
    while path do
        -- Try to get the git directory checking if it exists or from a git file
        git_dir = has_git_dir(path) or has_git_file(path)
        if git_dir ~= nil then
            break
        end
        -- Move to the parent directory, nil if there is none
        path = parent_pathname(path)
    end

    if not git_dir then
        return
    end

    if is_path_absolute(git_dir) then
        return git_dir
    end
    return path .. '/' .. git_dir
end

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_vcs.lua
local function get_git_branch()
    local current_dir = vim.fn.expand('%:p:h')

    local git_dir = get_git_dir(current_dir)
    if not git_dir then
        return ''
    end

    return git_dir
end

local has_git = get_git_branch()

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_vcs.lua
function M.get_git_detached_head()
    if has_git ~= '' then
        local git_branches_file = io.popen('git branch -a --no-abbrev', 'r')
        if not git_branches_file then
            return ''
        end
        local git_branches_data = git_branches_file:read('*l')
        io.close(git_branches_file)
        if not git_branches_data then
            return ''
        end

        return git_branches_data:sub(3)
    end

    return ''
end

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_diagnostic.lua
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

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_diagnostic.lua
function M.diagnostics_error()
    if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
        return get_nvim_lsp_diagnostic('Error')
    end

    return '0 '
end

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_diagnostic.lua
function M.diagnostics_warning()
    if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
        return get_nvim_lsp_diagnostic('Warning')
    end

    return '0 '
end

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline/provider_vcs.lua
function M.get_hunks_data()
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

local async_load = vim.loop.new_async(vim.schedule_wrap(function()
    local line
    if vim.fn.winwidth(0) > 30 then
        line = ''

        if global.fileType ~= 'Help' then
            line = line
                .. '%#StatuslineBackground#   '
                .. M.get_git_detached_head()
                .. '   %#StatuslineDiagnosticsError#'
                .. [[ %{luaeval('require("statusline").diagnostics_error()')}]]
                .. '%#StatuslineDiagnosticsWarning#'
                .. [[ %{luaeval('require("statusline").diagnostics_warning()')}]]
                .. '  %#StatuslineDiffAdded#'
                .. [[ %{luaeval('require("statusline").get_hunks_data()[1]')}]]
                .. ' %#StatuslineDiffModified#'
                .. [[ %{luaeval('require("statusline").get_hunks_data()[2]')}]]
                .. ' %#StatuslineDiffRemoved#'
                .. [[ %{luaeval('require("statusline").get_hunks_data()[3]')}]]
        end

        line = line .. '%#StatuslineBackground#%=ln %l, col %c   '

        if global.is_update then
            line = line
                .. 'Tabsizes '
                .. global.tab
                .. '   '
                .. global.lineBreak
                .. '   '
                .. global.fileType
                .. '   '
                .. global.format
        end

        line = line .. '%#StatuslineSmiley#  '
    else
        line = '%#StatuslineBackground#'
    end

    vim.wo.statusline = line
end))

-- Credit https://github.com/glepnir/galaxyline.nvim/blob/main/lua/galaxyline.lua
function M.load()
    async_load:send()
end

return M
