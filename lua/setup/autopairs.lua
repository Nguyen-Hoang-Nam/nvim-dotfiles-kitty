local npairs = require('nvim-autopairs')

require('nvim-autopairs.completion.cmp').setup({
    map_cr = true,
    map_complete = true,
    --     auto_select = true,
})

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
    },
})

-- local ts_conds = require('nvim-autopairs.ts-conds')
