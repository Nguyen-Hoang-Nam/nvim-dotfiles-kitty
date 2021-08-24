require('indent_blankline').setup({
    char = '▏',
    buftype_exclude = { 'terminal' },
    filetype_exclude = { 'help', 'dashboard', 'lspinfo', 'markdown', 'gomod' },
    --     show_end_of_line = true,
    use_treesitter = true,
    show_current_context = true,

    context_patterns = {
        'declaration',
        'expression',
        'pattern',
        'primary_expression',
        'statement',
        'switch_body',
        'function',
        'table', -- Lua
        'block', -- CSS
        'element', -- HTML
        'object', -- JS
        'class',
    },
})
