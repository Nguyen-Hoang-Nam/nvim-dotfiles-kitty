local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --stdin-filepath ${INPUT}',
        formatStdin = true,
        lintCommand = 'markdownlint -s',
        lintStdin = true,
        lintFormats = {
            '%f:%l %m',
            '%f:%l:%c %m',
            '%f: %l: %m',
        },
    },
}

M.all_format = { efm = 'Prettier' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
}

M.template = {
    ['1'] = [[
# 



## Installation



## Usage



## Contributing

Pull requests are welcome. For major changes, 
please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
]],
}

return M
