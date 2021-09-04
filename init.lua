require('options')

-- Setup
require('setup.bufferline')
require('setup.colorizer')
require('setup.dashboard')
require('setup.gitsigns')
require('setup.cmp')
-- require('setup.compe')
require('setup.autopairs')
require('setup.toggleterm')
-- require('setup.tree')
require('setup.treesitter')
require('setup.telescope')
require('setup.blankline')
require('setup.signature')
require('luasnip/loaders/from_vscode').lazy_load()
require('setup.lspconfig')
require('lspicon')
-- require('setup.spell')

require('lsp.emmet')
require('lsp.efm')
require('lsp.xml')
-- require('lsp.markdown')
require('lsp.tailwindcss')

require('tree')
require('highlights')
require('mappings')
require('autocommands')
