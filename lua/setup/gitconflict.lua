require("git-conflict").setup({
    default_mappings = false,
    disable_diagnostics = false,
    highlights = {
        incoming = "DiffText",
        current = "DiffAdd",
    },
})
