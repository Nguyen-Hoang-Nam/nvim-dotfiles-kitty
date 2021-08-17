local utils = require('utils')
local M = {}

local html = require('languages.html')
local css = require('languages.css')
local yaml = require('languages.yaml')
local typescript = require('languages.typescript')
local svelte = require('languages.svelte')
local python = require('languages.python')
local javascript = require('languages.javascript')
local java = require('languages.java')
local php = require('languages.php')
local markdown = require('languages.markdown')
local xml = require('languages.xml')
local go = require('languages.go')
local lua = require('languages.lua')
local tex = require('languages.tex')
local rust = require('languages.rust')
local json = require('languages.json')
local docker = require('languages.docker')

local formatters = {
    javascript = javascript.all_format,
    javascriptreact = javascript.all_format,
    typescript = typescript.all_format,
    typescriptreact = typescript.all_format,
    svelte = svelte.all_format,
    go = go.all_format,
    rust = rust.all_format,
    lua = lua.all_format,
    java = java.all_format,
    php = php.all_format,
    python = python.all_format,
    tex = tex.all_format,
    xml = xml.all_format,
    html = html.all_format,
    css = css.all_format,
    yaml = css.all_format,
    markdown = markdown.all_format,
    json = json.all_format,
    dockerfile = docker.all_format,
}

M.default_formatter = {
    javascript = javascript.default_format,
    javascriptreact = javascript.default_format,
    typescript = typescript.default_format,
    typescriptreact = typescript.default_format,
    svelte = svelte.default_format,
    go = go.default_format,
    rust = rust.default_format,
    lua = lua.default_format,
    java = java.default_format,
    php = php.default_format,
    python = python.default_format,
    tex = tex.default_format,
    xml = xml.default_format,
    html = html.default_format,
    css = css.default_format,
    yaml = yaml.default_format,
    markdown = markdown.default_format,
    json = json.default_format,
    dockerfile = docker.default_format,
}

M.choose_formatter = function()
    local fileType = vim.bo.filetype
    local all_formatters = formatters[fileType]
    local store_formatters = {}

    local count = 0
    for key, _ in pairs(all_formatters) do
        count = count + 1
        -- table.insert(store_formatters, key)
        store_formatters[#store_formatters + 1] = key
        print('[' .. count .. '] ' .. key)
    end

    if count > 1 then
        local option = vim.fn.input('Choose your formmatter: ')

        M.default_formatter[fileType] = store_formatters[tonumber(option)]
    end
end

M.formatter_status = function()
    local fileType = vim.bo.filetype
    if M.default_formatter[fileType] then
        return formatters[fileType][M.default_formatter[fileType]] .. '   '
    else
        return ''
    end
end

-- Credit https://github.com/terrortylor/neovim-environment/blob/main/lua/config/lsp/funcs.lua#L11
M.format = function()
    local clients = vim.lsp.buf_get_clients(0)
    local fileType = vim.bo.filetype
    local code_formatter = M.default_formatter[fileType]

    if utils.tablelength(clients) > 1 then
        -- check if multiple clients, and if efm is setup
        for _, c1 in pairs(clients) do
            if c1.name == code_formatter then
                c1.resolved_capabilities.document_formatting = true
                -- if efm then disable others
                for _, c2 in pairs(clients) do
                    -- print(c2.name, c2.resolved_capabilities.document_formatting)
                    if c2.name ~= code_formatter then
                        c2.resolved_capabilities.document_formatting = false
                    end
                end
                -- no need to contunue first loop
                break
            end
        end
    end

    vim.lsp.buf.formatting_sync(nil, 1000)
end

return M
