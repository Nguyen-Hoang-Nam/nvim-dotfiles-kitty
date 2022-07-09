local telescope = require("telescope")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local utils = require("utils.core")
local buffer_previewer = require("setup.telescope.buffer_previewer")

local is_hologram_preview = false
local support_filetype = { "png" } -- TODO: Support jpg, jpeg, webp, avif
local hologram_image

local is_support_filetype = function(filetype)
    return vim.tbl_contains(support_filetype, filetype)
end

-- NOTE: Use Hologram to show image
local buffer_previewer_maker = function(filepath, bufnr, opts)
    -- NOTE: Clear image when preview other file
    if is_hologram_preview then
        hologram_image:delete({ free = true })
        is_hologram_preview = false
    end

    local filetype = utils.file_extension(filepath)
    if is_support_filetype(filetype) then
        local preview_win_position = vim.api.nvim_win_get_position(opts.winid)
        local current_win_position = vim.api.nvim_win_get_position(0)
        local cursor_win_position = vim.api.nvim_win_get_cursor(0)
        local preview_win_height = vim.api.nvim_win_get_height(opts.winid)
        local preview_win_width = vim.api.nvim_win_get_width(opts.winid)

        -- if filetype == "jpg" or filetype == "jpeg" or filetype == "webp" or filetype == "avif" then
        --     local filename = "/tmp/" .. require("utils.md5").sumhexa(filepath) .. ".png"

        --     vim.loop.spawn("convert", {
        --         args = { filepath, filename },
        --     }, function()
        --         -- print(filename)
        --     end)

        --     filepath = filename
        -- end

        hologram_image = require("hologram.image"):new({
            buf = 0,
            source = filepath,
            row = preview_win_position[1] - current_win_position[1] - cursor_win_position[1] + 1,
            col = preview_win_position[2] - current_win_position[2] - cursor_win_position[2] + 2,
        })

        hologram_image:transmit({ column = preview_win_width, row = preview_win_height })

        is_hologram_preview = true
    else
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
end

buffer_previewer.teardown = function(_)
    if is_hologram_preview then
        hologram_image:delete({ free = true })
        is_hologram_preview = false
    end
end

telescope.setup({
    defaults = {
        prompt_prefix = "  ",

        layout_config = {
            horizontal = { mirror = false, preview_width = 0.5 },
        },

        buffer_previewer_maker = buffer_previewer_maker,

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
