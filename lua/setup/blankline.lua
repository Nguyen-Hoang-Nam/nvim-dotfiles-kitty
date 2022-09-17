require("indent_blankline").setup({
    char = "▏",
    filetype_exclude = { "dashboard", "markdown", "gomod", "Yanil", "haskell", "help" },
    use_treesitter = true,
    show_current_context = true,
    context_patterns = {
        "declaration",
        "expression",
        "pattern",
        "primary_expression",
        "statement",
        "switch_body",
        "function",
        "table", -- Lua
        "block", -- CSS
        "element", -- HTML
        "object", -- JS
        "class",
    },
})
