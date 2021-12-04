local bo = vim.bo
local cmd = vim.cmd
local api = vim.api

local M = {}

-- Delete current buffer
-- Unlike bdelete, this command will jump to next buffer by id
function M.bufdelete()
    if bo.modified then
        cmd('write')
    end

    local bufnr = api.nvim_get_current_buf()

    local buffers = vim.tbl_filter(function(buf)
        return bo[buf].buflisted and api.nvim_buf_is_valid(buf)
    end, api.nvim_list_bufs())

    if bufnr ~= buffers[#buffers] then
        cmd('bnext')
    else
        cmd('bprevious')
    end

    cmd('silent! ScrollViewDisable | bd ' .. bufnr .. ' | silent! ScrollViewEnable')
end

-- Count number of properties in table
-- Because of lua only count consecutive properties
-- @param T Table
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

-- function M.match_jump()
--     local current_node = require('nvim-treesitter.ts_utils').get_node_at_cursor()

--     if current_node:type() == 'string' then
--         local start_row, start_col, end_row, end_col = current_node:range()
--         local current_position = api.nvim_win_get_cursor(0)
--         local current_row = current_position[1]
--         local current_col = current_position[2]

--         if current_row == start_row + 1 and current_col == start_col then
--             api.nvim_win_set_cursor(0, { end_row + 1, end_col - 1 })
--         elseif current_row == end_row + 1 and current_col == end_col - 1 then
--             api.nvim_win_set_cursor(0, { start_row + 1, start_col })
--         end
--     else
--         require('nvim-treesitter.pairs').goto_partner()
--     end
-- end

function M.git_hover()
    local blame = require('git_utils').blame(vim.fn.expand('%:p'), vim.api.nvim_win_get_cursor(0)[1])

    local texts = { 'Author: ' .. blame.author, '' }

    local message = blame.message
    local count_line = 0
    for line in string.gmatch(message, '[^\n]+') do
        if count_line == 0 then
            table.insert(texts, 'Summary: ' .. line)
            table.insert(texts, '')
            count_line = count_line + 1
        else
            table.insert(texts, line)
        end
    end

    local width = 72
    local height = 10

    if #texts < 10 then
        height = #texts
    end

    local buf = api.nvim_create_buf(false, true)

    local opts = {
        relative = 'cursor',
        width = width,
        height = height,
        col = 0,
        row = 1,
        anchor = 'NW',
        style = 'minimal',
    }

    api.nvim_open_win(buf, 1, opts)

    api.nvim_buf_set_lines(buf, 0, #texts, false, texts)

    api.nvim_buf_set_keymap(buf, 'n', 'q', ':close<CR>', { silent = true, nowait = true, noremap = true })
end

return M
