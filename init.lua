vim.g.tex_flavor = "latex" -- Fix plaintex filetype in new tex file
vim.g.ultest_deprecation_notice = 0

require("options")

require("luasnip.loaders.from_vscode").lazy_load()
require("setup.aerial")
require("setup.autopairs")
require("setup.autosession")
require("setup.blankline")
require("setup.biscuits")
require("setup.bufferline")
require("setup.cmp")
require("setup.colorizer")
require("setup.diffview")
require("setup.fidget")
require("setup.gitsigns")
require("setup.goto")
require("setup.navic")
require("setup.rest")
require("setup.tabout")
require("setup.telescope")
require("setup.todo")
require("setup.toggleterm")
require("setup.treesitter")
require("setup.scrollbar")
require("setup.hologram")
require("setup.gitconflict")

require("lsp.lspconfig")
require("lsp.icon")

require("tree")

require("mappings")
require("highlights")
require("setup.dap")

require("autocommands")
require("autocommands.statusline")
require("autocommands.winbar")
