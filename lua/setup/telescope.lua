local telescope = require('telescope')
local actions = require('telescope.actions')

-- Credit https://github.com/nvim-telescope/telescope.nvim/issues/223#issuecomment-810091610
local previewers = require('telescope.previewers')
local Job = require('plenary.job')
local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job
        :new({
            command = 'file',
            args = { '--mime-type', '-b', filepath },
            on_exit = function(j)
                local mime_type = vim.split(j:result()[1], '/')[1]
                if mime_type == 'text' then
                    previewers.buffer_previewer_maker(filepath, bufnr, opts)
                else
                    -- maybe we want to write something to the buffer here
                    vim.schedule(function()
                        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
                    end)
                end
            end,
        })
        :sync()
end

-- Credit https://github.com/nvim-telescope/telescope.nvim
telescope.setup({
    defaults = {
        -- vimgrep_arguments = {
        --     'rg',
        --     '--hidden',
        --     '--color=never',
        --     '--no-heading',
        --     '--with-filename',
        --     '--line-number',
        --     '--column',
        --     '--smart-case',
        -- },

        mappings = { n = { ['q'] = actions.close } },
        prompt_prefix = ' ',
        -- selection_caret = ' ',
        -- initial_mode = 'insert',
        -- selection_strategy = 'reset',
        -- sorting_strategy = 'descending',
        -- layout_strategy = 'horizontal',
        layout_config = {
            horizontal = { mirror = false, preview_width = 0.5 },
            vertical = { mirror = false },
        },

        -- file_sorter = require('telescope.sorters').get_fuzzy_file,
        file_ignore_patterns = { 'node_modules', '.git' },
        -- generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        -- winblend = 0,
        -- border = {},
        -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        -- color_devicons = true,
        -- use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' },
        -- file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        -- grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        -- qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        buffer_previewer_maker = new_maker,
    },
})
