-- Credit https://github.com/glepnir/dashboard-nvim/blob/master/lua/dashboard/init.lua
local api = vim.api

local autogroup = api.nvim_create_augroup("Dashboard", {})

api.nvim_create_autocmd("Vimenter", {
    group = autogroup,
    pattern = "*",
    nested = true,
    callback = function()
        if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
            require("dashboard").instance()
        end
    end,
})

api.nvim_create_autocmd({ "BufLeave" }, {
    group = autogroup,
    pattern = "*",
    callback = function()
        local pos = api.nvim_win_get_cursor(0)
        api.nvim_win_set_var(0, "dashboard_prev_pos", pos)
    end,
})

api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    group = autogroup,
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "dashboard" then
            return
        end
    end,
})
