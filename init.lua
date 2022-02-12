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
require('setup.goto')
require('setup.aerial')
require('setup.rest')
require('setup.diffview')

require('lsp.lspconfig')
require('lsp.icon')

require('tree')

require('mappings')
require('highlights')
require('setup.dap')
require('autocommands')
