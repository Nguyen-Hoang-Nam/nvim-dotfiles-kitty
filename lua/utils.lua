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
if vim.tbl_isempty(vim.fn.sign_getdefined('CodeActionSign')) then
    vim.fn.sign_define('CodeActionSign', { text = '', texthl = 'LspDiagnosticsDefaultInformation' })
end

-- Credit https://github.com/kosayoda/nvim-lightbulb/blob/master/lua/nvim-lightbulb.lua
local function _update_sign(priority, old_line, new_line)
    if old_line then
        vim.fn.sign_unplace('code_action', { id = old_line, buffer = '%' })

        -- Update current lightbulb line
        vim.b.lightbulb_line = nil
    end

    -- Avoid redrawing lightbulb if code action line did not change
    if new_line and (vim.b.lightbulb_line ~= new_line) then
        vim.fn.sign_place(new_line, 'code_action', 'CodeActionSign', '%', { lnum = new_line, priority = priority })
        -- Update current lightbulb line
        vim.b.lightbulb_line = new_line
    end
end

-- Credit https://github.com/kosayoda/nvim-lightbulb/blob/master/lua/nvim-lightbulb.lua
local function handler_factory(line)
    return function(err, _, actions)
        if err then
            return
        end

        if actions == nil or vim.tbl_isempty(actions) then
            _update_sign(10, vim.b.lightbulb_line, nil)
        else
            _update_sign(10, vim.b.lightbulb_line, line + 1)
        end
    end
end

-- Credit https://github.com/kosayoda/nvim-lightbulb/blob/master/lua/nvim-lightbulb.lua
function M.code_action()
    local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
    local params = vim.lsp.util.make_range_params()
    params.context = context
    vim.lsp.buf_request(0, 'textDocument/codeAction', params, handler_factory(params.range.start.line))
end

return M
