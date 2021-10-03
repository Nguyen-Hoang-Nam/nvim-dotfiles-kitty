require('nvim-autopairs.completion.cmp').setup({
    map_cr = true,
    map_complete = true,
    auto_select = true,
    insert = false,
    map_char = {
        all = '(',
        tex = '{',
    },
})

require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
    },
})
