local M = {}

-- Credit https://stackoverflow.com/questions/2705793/how-to-get-number-of-entries-in-a-lua-table
function M.tablelength(T)
    local count = 0
    for _ in pairs(T) do
        count = count + 1
    end
    return count
end

return M
