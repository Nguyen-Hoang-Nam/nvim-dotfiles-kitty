-- Default option
require('compe').setup({
    -- enabled = true,
    -- autocomplete = true,
    -- debug = false,
    -- min_length = 1,
    -- preselect = 'enable',
    -- throttle_time = 80,
    -- source_timeout = 200,
    -- incomplete_delay = 400,
    -- max_abbr_width = 100,
    -- max_kind_width = 100,
    -- max_menu_width = 100,
    -- documentation = {
    --     max_width = 120,
    --     min_width = 60,
    --     max_height = math.floor(vim.o.lines * 0.3),
    --     min_height = 1,
    -- },
    source = {
        path = { priority = 6 },
        spell = { priority = 5, filetypes = { 'gitcommit', 'markdown' } },
        nvim_lua = { priority = 4, filetypes = { 'lua' } },
        luasnip = { priority = 3 },
        nvim_lsp = { priority = 2 },
        buffer = { priority = 1 },
        emoji = { priority = 1 },
    },
})

----------------------------------------
--
--
-- Credit https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
--
--
----------------------------------------
--
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
local luasnip = require('luasnip')

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t('<C-n>')
    elseif luasnip.expand_or_jumpable() then
        return t('<Plug>luasnip-expand-or-jump')
    elseif check_back_space() then
        return t('<Tab>')
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t('<C-p>')
    elseif luasnip.jumpable(-1) then
        return t('<Plug>luasnip-jump-prev')
    else
        return t('<S-Tab>')
    end
end
