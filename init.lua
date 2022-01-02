vim.g.tex_flavor = 'latex' -- Fix plaintex filetype in new tex file

require('options')

require('setup.autosession')
require('setup.bufferline')
require('setup.colorizer')
require('setup.dashboard')
require('setup.gitsigns')
require('setup.cmp')
require('setup.autopairs')
require('setup.toggleterm')
require('setup.treesitter')
require('setup.telescope')
require('setup.blankline')
require('setup.signature')
require('luasnip/loaders/from_vscode').lazy_load()
require('setup.lspconfig')
require('setup.goto')
require('setup.aerial')
require('setup.rest')

require('lspicon')

require('lsp.emmet')
require('lsp.efm')
-- require('lsp.markdown')
require('lsp.tailwindcss')

require('tree')

require('mappings')
require('highlights')
require('setup.dap')
require('autocommands')
