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

local lspKindIcons = {
    Class = ' (class)',
    Color = ' (color)',
    Constant = ' (constant)',
    Constructor = ' (constructor)',
    Enum = ' (enum)',
    EnumMember = ' (enum member)',
    Event = ' (event)',
    Field = ' (field)',
    File = ' (file)',
    Folder = ' (folder)',
    Function = ' (function)',
    Interface = ' (interface)',
    Keyword = ' (keyword)',
    Method = ' (method)',
    Module = '{} (module)',
    Operator = ' (operator)',
    Property = ' (property)',
    Reference = ' (reference)',
    Snippet = ' (snippet)',
    Struct = ' (enum)',
    Text = ' (text)',
    TypeParameter = ' (type parameter)',
    Unit = ' (unit)',
    Value = ' (value)',
    Variable = ' (variable)',
}

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),

        ['<Tab>'] = function(_)
            if fn.pumvisible() == 1 then
                fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            elseif luasnip.expand_or_jumpable() then
                fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            elseif check_back_space() then
                fn.feedkeys(replace_keycodes('<C-q>'))
            else
                fn.feedkeys(replace_keycodes('<Plug>(Tabout)'))
            end
        end,

        ['<S-Tab>'] = function(fallback)
            if fn.pumvisible() == 1 then
                fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            elseif luasnip.jumpable(-1) then
                fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
                fallback()
            end
        end,
    },

    formatting = {
        format = function(_, vim_item)
            vim_item.kind = lspKindIcons[vim_item.kind]

            --             vim_item.menu = ({
            --                 nvim_lsp = '[LSP]',
            --                 luasnip = '[Snippet]',
            --                 path = '[Path]',
            --             })[entry.source.name]

            return vim_item
        end,
    },
})
