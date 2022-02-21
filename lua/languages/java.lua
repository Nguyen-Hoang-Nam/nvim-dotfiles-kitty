local api = vim.api
local M = {}

M.efm = {
    -- {
    --     formatCommand = 'prettier --tab-width=4 --stdin-filepath ${INPUT}',
    --     formatStdin = true,
    -- },
}

M.all_format = { efm = 'Prettier' }

M.default_format = 'efm'

local function on_attach(_, bufnr)
    require('jdtls.setup').add_commands()

    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    local function buf_set_keymap(mode, mapping, command)
        api.nvim_buf_set_keymap(bufnr, mode, mapping, command, opts)
    end

    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    buf_set_keymap('n', '<Leader>d', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    buf_set_keymap('n', '<Leader><Leader>', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

    buf_set_keymap('n', 'gdi', "<Cmd>lua require'jdtls'.organize_imports()<CR>")
    buf_set_keymap('n', 'gdt', "<Cmd>lua require'jdtls'.test_class()<CR>")
    buf_set_keymap('n', 'gdn', "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
    buf_set_keymap('v', 'gde', "<Esc><Cmd>lua require'jdtls'.extract_variable(true)<CR>")
    buf_set_keymap('n', 'gde', "<Cmd>lua require'jdtls'.extract_variable()<CR>")
    buf_set_keymap('v', 'gdm', "<Esc><Cmd>lua require'jdtls'.extract_method(true)<CR>")

    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

local capabilities = {
    workspace = {
        configuration = true,
    },
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true,
            },
        },
    },
}

M.lsp = {
    capabilities = capabilities,
    on_attach = on_attach,
}

M.template = {
    ['1'] = [[
package %s;

public class %s {


}]],
    ['2'] = [[
package %s;

public interface %s {


}]],
}

return M
