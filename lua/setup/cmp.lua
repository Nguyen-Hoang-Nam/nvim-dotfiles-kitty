local cmp = require("cmp")
local luasnip = require("luasnip")
local fn = vim.fn

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local check_back_space = function()
    local col = fn.col(".") - 1
    if col == 0 or fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

local lspKindIcons = require("settings").kinds

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = {
        ["<M-e>"] = cmp.mapping.complete(),

        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),

        ["<Tab>"] = function(_)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_back_space() then
                feedkey("<Tab>", "n")
            else
                feedkey("<Plug>(Tabout)", "")
            end
        end,

        ["<S-Tab>"] = function(_)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif check_back_space() then
                feedkey("<C-d>", "i")
            else
                feedkey("<Plug>(TaboutBack)", "")
            end
        end,
    },

    formatting = {
        format = function(_, vim_item)
            if string.len(vim_item.abbr) > 60 then
                vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
            end

            vim_item.kind = lspKindIcons[vim_item.kind]

            return vim_item
        end,
    },

    window = {
        documentation = {
            maxwidth = 30,
        },
    },

    enabled = function()
        local context = require("cmp.config.context")
        if vim.api.nvim_get_mode().mode == "c" then
            return true
        else
            return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end
    end,
})

require("cmp").setup.cmdline(":", {
    sources = {
        { name = "cmdline" },
    },
})
