local g = vim.g

g.indent_blankline_use_treesitter = true
g.indent_blankline_show_end_of_line = true
g.indent_blankline_filetype_exclude = { 'help', 'dashboard', 'lspinfo', 'markdown', 'gomod', 'xml' }
g.indent_blankline_show_current_context = true
g.indent_blankline_char = '▏'

-- Credit https://github.com/lukas-reineke/indent-blankline.nvim/issues/61#issuecomment-869893541
g.indent_blankline_context_patterns = {
    'declaration',
    'expression',
    'pattern',
    'primary_expression',
    'statement',
    'switch_body',
}
