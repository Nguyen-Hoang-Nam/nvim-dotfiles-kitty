local from_entry = require("telescope.from_entry")
local Path = require("plenary.path")
local conf = require("telescope.config").values
local Previewers = require("telescope.previewers")

local buffer_previewers = {
    teardown = nil,
}

local function defaulter(f, default_opts)
    default_opts = default_opts or {}
    return {
        new = function(opts)
            if conf.preview == false and not opts.preview then
                return false
            end
            opts.preview = type(opts.preview) ~= "table" and {} or opts.preview
            if type(conf.preview) == "table" then
                for k, v in pairs(conf.preview) do
                    opts.preview[k] = vim.F.if_nil(opts.preview[k], v)
                end
            end
            return f(opts)
        end,
        __call = function()
            local ok, err = pcall(f(default_opts))
            if not ok then
                error(debug.traceback(err))
            end
        end,
    }
end

-- NOTE: Add teardown to cat previewer to clear image when close Telescope
buffer_previewers.cat = defaulter(function(opts)
    opts = opts or {}
    local cwd = opts.cwd or vim.loop.cwd()
    return Previewers.new_buffer_previewer({
        title = "File Preview",
        dyn_title = function(_, entry)
            return Path:new(from_entry.path(entry, true)):normalize(cwd)
        end,

        get_buffer_by_name = function(_, entry)
            return from_entry.path(entry, true)
        end,

        define_preview = function(self, entry, _)
            local p = from_entry.path(entry, true)
            if p == nil or p == "" then
                return
            end

            conf.buffer_previewer_maker(p, self.state.bufnr, {
                bufname = self.state.bufname,
                winid = self.state.winid,
                preview = opts.preview,
            })
        end,

        teardown = buffer_previewers.teardown,
    })
end, {})

return buffer_previewers
