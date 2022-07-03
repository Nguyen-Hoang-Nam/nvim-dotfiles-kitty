local sidebar = require("sidebar")

require("aerial").setup({
    backends = { "treesitter", "lsp", "markdown" },

    default_direction = sidebar.sidebar_position,
    max_width = sidebar.sidebar_width,
    min_width = sidebar.sidebar_width,
})
