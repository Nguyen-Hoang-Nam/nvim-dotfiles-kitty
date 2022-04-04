local telescope = require('telescope')
local previewers = require('telescope.previewers')

local new_maker = function(filepath, bufnr, opts)
    opts = opts or {}

    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then
            return
        end
        if stat.size > 100000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end

telescope.setup({
    defaults = {
        prompt_prefix = '  ',

        layout_config = {
            horizontal = { mirror = false, preview_width = 0.5 },
        },

        buffer_previewer_maker = new_maker,

        -- preview = {
        --     mime_hook = function(filepath, bufnr, opts)
        --         local get_extension = function(path)
        --             local split_path = vim.split(path:lower(), '.', { plain = true })
        --             return split_path[#split_path]
        --         end

        --         local is_image = function(path)
        --             local image_extensions = { 'png', 'jpg' } -- Supported image formats
        --             local extension = get_extension(path)
        --             return vim.tbl_contains(image_extensions, extension)
        --         end

        --         if is_image(filepath) then
        --             local term = vim.api.nvim_open_term(bufnr, {})
        --             local function send_output(_, data, _)
        --                 for _, d in ipairs(data) do
        --                     vim.api.nvim_chan_send(term, d .. '\r\n')
        --                 end
        --             end

        --             vim.fn.jobstart({
        --                 'vimg',
        --                 filepath,
        --                 72,
        --                 vim.o.lines - 32,
        --                 20,
        --                 20,
        --             }, { on_stdout = send_output, stdout_buffered = true })
        --         else
        --             require('telescope.previewers.utils').set_preview_message(
        --                 bufnr,
        --                 opts.winid,
        --                 'Binary cannot be previewed'
        --             )
        --         end
        --     end,
        -- },
    },

    pickers = {
        find_files = {
            find_command = {
                'fd',
                '--type',
                'f',
                '--strip-cwd-prefix',
                '--hidden',
                '--exclude',
                '.git',
            },
        },
    },
})

telescope.load_extension('fzf')
