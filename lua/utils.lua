local api = vim.api
local cmd = vim.cmd
local bo = vim.bo
local lsp = vim.lsp
local fn = vim.fn

local M = {}

-- Credit https://stackoverflow.com/questions/2705793/how-to-get-number-of-entries-in-a-lua-table
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

        -- Update current lightbulb line
        vim.b.code_action_line = nil
    end

    -- Avoid redrawing lightbulb if code action line did not change
    if new_line and (vim.b.code_action_line ~= new_line) then
        fn.sign_place(new_line, 'code_action', 'CodeActionSign', '%', { lnum = new_line, priority = 10 })

        -- Update current lightbulb line
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

-- Credit https://github.com/famiu/bufdelete.nvim/blob/master/lua/bufdelete/init.lua
function M.bufdelete()
    if bo.modified then
        cmd('write')
    end

    local bufnr = api.nvim_get_current_buf()

    -- Get list of windows IDs with the buffer to close
    local windows = vim.tbl_filter(function(win)
        return api.nvim_win_get_buf(win) == bufnr
    end, api.nvim_list_wins())

    if #windows == 0 then
        return
    end

    -- Get list of active buffers
    local buffers = vim.tbl_filter(function(buf)
        return bo[buf].buflisted and api.nvim_buf_is_valid(buf)
    end, api.nvim_list_bufs())

    -- If there is only one buffer (which has to be the current one), vim will
    -- create a new buffer on :bd.  If there are only two buffers (one of which
    -- has to be the current one), vim will switch to the other buffer on :bd.
    -- Otherwise, pick the next buffer (wrapping around if necessary)
    local buffer_len = #buffers
    if buffer_len > 2 then
        for i, v in ipairs(buffers) do
            if v == bufnr then
                local next_buffer = buffers[i % buffer_len + 1]
                for _, win in ipairs(windows) do
                    api.nvim_win_set_buf(win, next_buffer)
                end

                break
            end
        end
    end

    cmd('silent! ScrollViewDisable | bd ' .. bufnr .. ' | silent! ScrollViewEnable')
end

return M
