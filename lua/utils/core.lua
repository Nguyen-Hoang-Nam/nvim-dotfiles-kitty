local bo = vim.bo
local cmd = vim.cmd
local api = vim.api

local M = {}

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

function M.git_hover()
    local blame = require('git_utils').blame(vim.fn.expand('%:p'), vim.api.nvim_win_get_cursor(0)[1])

    local texts = { 'Author: ' .. blame.author, '' }

    local message = blame.message
    local count_line = 0
    for line in string.gmatch(message, '([^\n]*)(\n?)') do
        if count_line == 0 then
            table.insert(texts, 'Summary: ' .. line)
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

    api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    api.nvim_buf_set_option(buf, 'bufhidden', 'delete')
    api.nvim_buf_set_option(buf, 'modifiable', false)
end

return M
