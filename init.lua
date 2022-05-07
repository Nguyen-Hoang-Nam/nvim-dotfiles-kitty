vim.g.tex_flavor = 'latex' -- Fix plaintex filetype in new tex file

require('options')

require('luasnip.loaders.from_vscode').lazy_load()
require('setup.aerial')
require('setup.autopairs')
require('setup.autosession')
require('setup.blankline')
require('setup.biscuits')
require('setup.bufferline')
require('setup.cmp')
require('setup.colorizer')
require('setup.dashboard')
require('setup.diffview')
require('setup.fidget')
require('setup.gitsigns')
require('setup.goto')
require('setup.rest')
require('setup.telescope')
require('setup.todo')
require('setup.toggleterm')
require('setup.treesitter')
require('setup.scrollbar')

require('lsp.lspconfig')
require('lsp.icon')

require('tree')

require('mappings')
require('highlights')
require('setup.dap')
require('autocommands')
