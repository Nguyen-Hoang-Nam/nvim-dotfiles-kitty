local cmp = require('cmp')
local luasnip = require('luasnip')
local fn = vim.fn

require('tabout').setup({
    tabkey = '',
    backwards_tabkey = '',
})

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

local lspKindIcons = require('theme').lspKindIcons

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<M-e>'] = cmp.mapping.complete(),

        ['<Tab>'] = cmp.mapping(function(_)
            if fn.pumvisible() == 1 then
                fn.feedkeys(replace_keycodes('<C-n>'), 'n')
                -- cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                fn.feedkeys(replace_keycodes('<Plug>luasnip-expand-or-jump'), '')
            elseif check_back_space() then
                fn.feedkeys(replace_keycodes('<Tab>'), 'n')
            else
                fn.feedkeys(replace_keycodes('<Plug>(Tabout)'))
            end
        end, {
            'i',
            's',
        }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if fn.pumvisible() == 1 then
                fn.feedkeys(replace_keycodes('<C-p>'), 'n')
            elseif luasnip.jumpable(-1) then
                fn.feedkeys(replace_keycodes('<Plug>luasnip-jump-prev'), '')
            else
                fallback()
            end
        end, {
            'i',
            's',
        }),
    },

    formatting = {
        format = function(_, vim_item)
            vim_item.kind = lspKindIcons[vim_item.kind]

            return vim_item
        end,
    },
})
