local treesitter_config = require("nvim-treesitter.configs")

treesitter_config.setup({
	ensure_installed = { "javascript" },
	highlight = { enable = true, use_languagetree = true },
	rainbow = { enable = true },
	autotag = { enable = true },
})
