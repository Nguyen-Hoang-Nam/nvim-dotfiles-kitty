local api = vim.api

local M = {}

-- Credit https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
function M.on_attach(_, bufnr)
    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    local function buf_set_keymap(mode, mapping, command)
        api.nvim_buf_set_keymap(bufnr, mode, mapping, command, opts)
    end

    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', '<Leader>d', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    buf_set_keymap('n', '<Leader><Leader>', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

M.capabilities = capabilities

return M
