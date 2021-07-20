local theme = require('../theme')

require('base16-colorscheme').setup({
    colors = {
        base00 = '#282c34',
        base01 = '#353b45',
        base02 = '#3e4451',
        base03 = '#545862',
        base04 = '#565c64',
        base05 = '#abb2bf',
        base06 = '#b6bdca',
        base07 = '#c8ccd4',
        base08 = theme.red,
        base09 = theme.orange,
        base0A = theme.yellow,
        base0B = theme.green,
        base0C = theme.cyan,
        base0D = theme.blue,
        base0E = theme.purple,
        base0F = theme.tomato,
    },

    treesitter = {
        TSKeywordFunction = 'italic',
        TSKeyword = 'italic',
        TSConditional = 'italic',
        TSConstant = 'italic',
        TSBoolean = 'italic',
        TSFloat = 'italic',
        TSNumber = 'italic',
        TSType = 'italic',
        TSRepeat = 'italic',
    },
})
