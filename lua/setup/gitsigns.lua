local gitsigns = require('gitsigns')

gitsigns.setup({
    signs = {
        add = { hl = 'GitSignsAdd', text = '▌' },
        change = { hl = 'GitSignsChange', text = '▌' },
        delete = { hl = 'GitSignsDelete', text = '▌' },
        topdelete = { hl = 'GitSignsDelete', text = '‾' },
        changedelete = { hl = 'GitSignsChange', text = '~' },
    },
    numhl = false,
    linehl = false,
    watch_index = {
        interval = 100,
    },
    current_line_blame = true,
    sign_priority = 5,
    status_formatter = nil,
})
