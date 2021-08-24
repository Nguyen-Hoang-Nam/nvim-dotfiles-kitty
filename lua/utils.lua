local api = vim.api
local cmd = vim.cmd
local bo = vim.bo
local lsp = vim.lsp
local fn = vim.fn

local M = {}

-- Find length of table
-- @param T Table
function M.tablelength(T)
    local count = 0

    for _ in pairs(T) do
        count = count + 1
    end

    return count
end

-- Credit https://github.com/kosayoda/nvim-lightbulb/blob/master/lua/nvim-lightbulb.lua
local function _update_sign(new_line)
    local old_line = vim.b.code_action_line
    if old_line then
        fn.sign_unplace('code_action', { id = old_line, buffer = '%' })

        vim.b.code_action_line = nil
    end

    if new_line and (vim.b.code_action_line ~= new_line) then
        fn.sign_place(new_line, 'code_action', 'CodeActionSign', '%', { lnum = new_line, priority = 10 })

        vim.b.code_action_line = new_line
    end
end

-- Credit https://github.com/kosayoda/nvim-lightbulb/blob/master/lua/nvim-lightbulb.lua
function M.code_action()
    local context = { diagnostics = lsp.diagnostic.get_line_diagnostics() }
    local params = lsp.util.make_range_params()

    params.context = context
    lsp.buf_request(0, 'textDocument/codeAction', params, function(err, _, actions)
        if err then
            return
        end

        if actions == nil or vim.tbl_isempty(actions) then
            _update_sign(nil)
        else
            _update_sign(params.range.start.line + 1)
        end
    end)
end

function M.bufdelete()
    if bo.modified then
        cmd('write')
    end

    local bufnr = api.nvim_get_current_buf()

    cmd('bnext')
    cmd('silent! ScrollViewDisable | bd ' .. bufnr .. ' | silent! ScrollViewEnable')
end

local function check_mix_lang()
    local file_type = vim.api.nvim_buf_get_option(0, 'filetype')

    return file_type == 'tsx' or file_type == 'svelte' or file_type == 'html'
end

-- Credit https://github.com/terrortylor/nvim-comment/blob/main/lua/nvim_comment.lua
function M.comment_toggle(line_start, line_end)
    if check_mix_lang() then
        require('ts_context_commentstring.internal').update_commentstring()
    end

    local cs = api.nvim_buf_get_option(0, 'commentstring')

    if not cs:find('%%s') then
        return
    end

    local left, right = cs:match('^(.*)%%s(.*)')
    if right == '' then
        right = nil
    elseif not right:match('^%s') then
        right = ' ' .. right
    end

    if not left:match('%s$') then
        left = left .. ' '
    end

    local lines = api.nvim_buf_get_lines(0, line_start - 1, line_end, false)
    if not lines then
        return
    end

    local esc_left = vim.pesc(left)
    local is_comment = false

    for _, v in pairs(lines) do
        if v:find('^%s*' .. esc_left) or v:match('^%s*$') then
            is_comment = true
        elseif is_comment then
            is_comment = false
            break
        end
    end

    if not is_comment then
        for i, v in pairs(lines) do
            if not v:match('^%s*$') then
                local line = v:gsub('^', '')
                if right then
                    line = line .. right
                end

                lines[i] = left .. line
            end
        end
    else
        for i, v in pairs(lines) do
            local line = v
            if right then
                line = line:gsub(vim.pesc(right) .. '$', '')
            end

            lines[i] = line:gsub(vim.pesc(left), '', 1)
        end
    end

    api.nvim_buf_set_lines(0, line_start - 1, line_end, false, lines)

    -- The lua call seems to clear the visual selection so reset it
    -- 2147483647 is vimL built in
    api.nvim_call_function('setpos', { "'<", { 0, line_start, 1, 0 } })
    api.nvim_call_function('setpos', { "'>", { 0, line_end, 2147483647, 0 } })
end

function M.match_jump()
    local current_node = require('nvim-treesitter.ts_utils').get_node_at_cursor()

    if current_node:type() == 'string' then
        local start_row, start_col, end_row, end_col = current_node:range()
        local current_position = api.nvim_win_get_cursor(0)
        local current_row = current_position[1]
        local current_col = current_position[2]

        if current_row == start_row + 1 and current_col == start_col then
            api.nvim_win_set_cursor(0, { end_row + 1, end_col - 1 })
        elseif current_row == end_row + 1 and current_col == end_col - 1 then
            api.nvim_win_set_cursor(0, { start_row + 1, start_col })
        end
    else
        require('nvim-treesitter.pairs').goto_partner()
    end
end

vim.api.nvim_command("command! -range CommentToggle lua require('utils').comment_toggle(<line1>, <line2>)")

return M
