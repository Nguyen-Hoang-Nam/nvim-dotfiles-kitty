local M = {}

function M.file_supported(file_extension)
    return file_extension == 'java' or file_extension == 'md'
end

local function remove_extension(filename, file_extension)
    return string.sub(filename, 1, #filename - #file_extension - 1)
end

local function slice(tbl, s, e)
    local new_tbl = {}

    for i = s, e do
        table.insert(new_tbl, tbl[i])
    end

    return new_tbl
end

local function java_group(path, filename)
    local t = {}
    local find_java = false
    local position = 0
    for str in string.gmatch(path, '([^/]+)') do
        if str == 'java' then
            find_java = true
            position = #t + 1
        end

        if str ~= filename then
            table.insert(t, str)
        end
    end

    if find_java then
        local new_tbl = slice(t, position + 1, #t)
        return table.concat(new_tbl, '.')
    end

    return t[#t]
end

function M.generate(file_extension, filename, path, file_type)
    if file_extension == 'md' and filename == 'README.md' then
        return require('languages.markdown').template
    elseif file_extension == 'java' then
        local template = require('languages.java').template[file_type]
        local name = remove_extension(filename, file_extension)
        local group = java_group(path, filename)

        return string.format(template, group, name)
    end
end

return M
