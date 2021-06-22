require 'setup.bufferline'
require 'setup.comment'
require 'setup.compe'
require 'setup.colorizer'
require 'setup.dashboard'
require 'setup.galaxyline'
require 'setup.gitsigns'
require 'setup.lsp'
require'lspkind'.init({File = " "})
require'lsp-colors'.setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
})
require 'setup.autopairs'
require 'setup.formatter'
require 'setup.toggleterm'
require 'setup.tree'
require 'setup.treesitter'
require 'setup.trouble'
require 'setup.telescope'
require 'setup.signature'
require 'setup.base16'
