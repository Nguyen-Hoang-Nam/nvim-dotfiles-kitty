local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg', '--hidden', '--color=never', '--no-heading',
            '--with-filename', '--line-number', '--column', '--smart-case'
        },
        mappings = {n = {["q"] = actions.close}},
        prompt_position = "bottom",
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {
            horizontal = {mirror = false, preview_width = 0.5},
            vertical = {mirror = false}
        },
        file_sorter = require"telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = {"node_modules", ".git"},
        generic_sorter = require"telescope.sorters".get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"},
        file_previewer = require"telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require"telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require"telescope.previewers".vim_buffer_qflist.new,
        buffer_previewer_maker = require"telescope.previewers".buffer_previewer_maker
    }
}
