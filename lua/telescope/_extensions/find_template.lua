-- Credit https://github.com/glepnir/template.nvim/blob/main/lua/telescope/_extensions/find_template.lua
local telescope = require("telescope")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local entry_display = require("telescope.pickers.entry_display")

local templates = require("templates.templates")

local find_template = function(opts)
    opts = opts or {}

    -- Credit https://github.com/xiyaowong/telescope-emoji.nvim/blob/master/lua/telescope/_extensions/emoji.lua
    local displayer = entry_display.create({
        separator = " ",
        items = {
            { width = 40 },
            { width = 18 },
            { remaining = true },
        },
    })

    local make_display = function(entry)
        return displayer({
            entry.value .. " " .. entry.name,
        })
    end

    pickers.new(opts, {
        prompt_title = "Templates",
        results_title = "Templates",
        sorter = conf.generic_sorter(opts),
        finder = finders.new_table({
            results = templates,
            entry_maker = function(template)
                return {
                    ordinal = template.name,
                    display = make_display,

                    name = template.name,
                    value = template.value,
                }
            end,
        }),
    }):find()
end

return telescope.register_extension({ exports = { find_template = find_template } })
