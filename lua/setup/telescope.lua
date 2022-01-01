local telescope = require('telescope')

telescope.setup({
    defaults = {
        prompt_prefix = '  ',

        layout_config = {
            horizontal = { mirror = false, preview_width = 0.5 },
            vertical = { mirror = false },
        },

        file_ignore_patterns = { 'node_modules/' },
        set_env = { COLORTERM = 'truecolor' },
    },

    -- Remove ./ from fd results
    -- Credits https://github.com/nvim-telescope/telescope.nvim/pull/1532
    pickers = {
        find_files = {
            find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
        },
    },
})

telescope.load_extension('fzf')
