local api = vim.api
local M = {}

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

return M
