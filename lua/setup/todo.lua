require('todo-comments').setup({
    keywords = {
        FIX = {
            icon = ' ',
            color = 'error',
            alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
        },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
    },
})
