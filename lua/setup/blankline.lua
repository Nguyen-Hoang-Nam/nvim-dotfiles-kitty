require('indent_blankline').setup({
    char = '▏',
    buftype_exclude = { 'terminal' },
    filetype_exclude = { 'help', 'dashboard', 'lspinfo', 'markdown', 'gomod', 'xml' },
    show_en_of_line = true,
    use_treesitter = true,

    context_patterns = {
        'declaration',
        'expression',
        'pattern',
        'primary_expression',
        'statement',
        'switch_body',
    },
})
