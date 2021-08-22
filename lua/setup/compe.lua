local fn = vim.fn

require('compe').setup({

    source = {
        path = {
            priority = 6,
            filter_list = { 'javascript', 'javascriptreact', 'svelte', 'typescript', 'typescriptreact', 'go' },
        },
        spell = { priority = 5, filetypes = { 'gitcommit', 'markdown' } },
        nvim_lua = { priority = 4, filetypes = { 'lua' } },
        luasnip = {
            priority = 3,
            filetypes = {
                'lua',
                'javascript',
                'javascriptreact',
                'html',
                'svelte',
                'typescript',
                'typescriptreact',
                'go',
                'rust',
                'java',
                'php',
                'xml',
            },
        },
        nvim_lsp = {
            priority = 2,
            filetypes = {
                'lua',
                'javascript',
                'javascriptreact',
                'html',
                'css',
                'svelte',
                'typescript',
                'typescriptreact',
                'go',
                'rust',
                'java',
                'php',
                'markdown',
                'python',
            },
        },
        --         buffer = { priority = 1 },
        --         emoji = { priority = 1 },
    },
})

-- Credit https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local replace_keycodes = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = fn.col('.') - 1
    if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

local luasnip = require('luasnip')

require('tabout').setup({
    tabkey = '',
    backwards_tabkey = '',
})

_G.tab_complete = function()
    if fn.pumvisible() == 1 then
        return replace_keycodes('<C-n>')
    elseif luasnip.expand_or_jumpable() then
        return replace_keycodes('<Plug>luasnip-expand-or-jump')
    elseif check_back_space() then
        return replace_keycodes('<Tab>')
    else
        return replace_keycodes('<Plug>(Tabout)')
        --     else
        --         return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if fn.pumvisible() == 1 then
        return replace_keycodes('<C-p>')
    elseif luasnip.jumpable(-1) then
        return replace_keycodes('<Plug>luasnip-jump-prev')
    else
        return replace_keycodes('<S-Tab>')
    end
end
