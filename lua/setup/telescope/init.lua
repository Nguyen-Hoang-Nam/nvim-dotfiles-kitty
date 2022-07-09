local telescope = require("telescope")
local actions = require("telescope.actions")
local buffer_previewer = require("setup.telescope.buffer_previewer")
local hologram = require("setup.telescope.hologram")

buffer_previewer.teardown = hologram.teardown

telescope.setup({
    defaults = {
        prompt_prefix = "  ",

        layout_config = {
            horizontal = { mirror = false, preview_width = 0.5 },
        },

        buffer_previewer_maker = hologram.buffer_previewer_maker,

        mappings = {
            i = {
                ["<M-j>"] = actions.move_selection_next,
                ["<M-k>"] = actions.move_selection_previous,
                ["<M-q>"] = actions.close,
            },
        },

        file_previewer = buffer_previewer.cat.new,
    },

    pickers = {
        find_files = {
            find_command = {
                "fd",
                "--type",
                "f",
                "--strip-cwd-prefix",
                "--hidden",
                "--exclude",
                ".git",
            },
        },
    },

    extensions = {
        aerial = {
            show_nesting = true,
        },
    },
})

telescope.load_extension("fzf") -- Better fuzzy search result
telescope.load_extension("ui-select") -- Use for lsp action
telescope.load_extension("aerial")
