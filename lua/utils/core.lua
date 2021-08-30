local bo = vim.bo
local cmd = vim.cmd
local api = vim.api

local M = {}

function M.bufdelete()
    if bo.modified then
        cmd('write')
    end

    local bufnr = api.nvim_get_current_buf()

    cmd('bnext')
    cmd('silent! ScrollViewDisable | bd ' .. bufnr .. ' | silent! ScrollViewEnable')
end

function M.tablelength(T)
    local count = 0

    for _ in pairs(T) do
        count = count + 1
    end

    return count
end

function M.file_extension(filename)
    local t = {}
    for str in string.gmatch(filename, '([^%.]+)') do
        table.insert(t, str)
    end

    if #t == 1 or t[1] == '' then
        return ''
    end

    return t[#t]
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

return M
