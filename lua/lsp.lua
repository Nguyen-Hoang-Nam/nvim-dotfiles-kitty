local M = {}

-- local global = require('global')
local all_format = {
    javascript = {
        efm = 'Prettier',
        tsserver = 'Tssever',
    },
    typescript = {
        efm = 'Prettier',
        tsserver = 'Tssever',
    },
    svelte = { efm = 'Pretter-Plugin-Svelte' },
    go = { efm = 'Goimports   Gofumpt' },
    rust = {
        efm = 'Rustfmt',
        rust_analyzer = 'Rust-Analyzer',
    },
    lua = { efm = 'Stylua' },
    java = { efm = 'Prettier' },
}

M.format_lsp = {
    javascript = 'efm',
    typescript = 'efm',
    svelte = 'efm',
    go = 'efm',
    rust = 'efm',
    lua = 'efm',
    java = 'efm',
}

-- Credit https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
function M.on_attach(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', 'gtD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gce>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', 'gq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}

M.capabilities = capabilities

require('lsp_signature').on_attach({
    handler_opts = {
        border = 'none',
    },
})

M.formatter = function()
    local fileType = vim.bo.filetype
    if M.format_lsp[fileType] then
        return all_format[fileType][M.format_lsp[fileType]] .. '   '
    else
        return ''
    end
end

-- Credit https://github.com/terrortylor/neovim-environment/blob/main/lua/config/lsp/funcs.lua#L11
M.choose_format = function()
    local clients = vim.lsp.buf_get_clients(0)
    local fileType = vim.bo.filetype
    local code_formatter = M.format_lsp[fileType]

    if #clients > 1 then
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
