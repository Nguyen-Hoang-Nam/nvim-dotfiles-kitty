require('options')

-- Setup
require('setup.bufferline')
require('setup.comment')
require('setup.colorizer')
require('setup.dashboard')
require('setup.gitsigns')
require('setup.compe')
require('setup.autopairs')
require('setup.toggleterm')
require('setup.tree')
require('setup.treesitter')
require('setup.trouble')
require('setup.telescope')
require('setup.base16')
require('setup.blankline')
require('setup.signature')
require('setup.nonicons')
-- require('setup.snips')
require('luasnip/loaders/from_vscode').lazy_load()
require('setup.lspconfig')
-- require('setup.spell')

-- Language
require('langs.go')
require('langs.html')
require('langs.css')
require('langs.yaml')
require('langs.docker')
require('langs.typescript')
require('langs.svelte')
require('langs.python')
require('langs.rust')
require('langs.lua')
require('langs.tex')
require('langs.efm')
require('langs.emmet')
require('langs.java')
require('langs.php')

require('statusline')
require('highlight')
require('mappings')
require('autocommands')
