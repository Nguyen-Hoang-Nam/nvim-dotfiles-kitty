local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local action_state = require('telescope.actions.state')

local jdtls = require('jdtls')

local java = require('languages.java')

local M = {}

function M.setup()
    local extendedClientCapabilities = jdtls.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    local config = {
        flags = {
            server_side_fuzzy_completion = true,
        },

        handlers = {
            ['language/status'] = function() end,
        },

        cmd = { 'java-lsp.sh' },
        on_attach = java.lsp.on_attach,

        settings = {
            java = {
                signatureHelp = { enabled = true },
                contentProvider = { preferred = 'fernflower' },
                completion = {
                    favoriteStaticMembers = {},
                },

                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999,
                    },
                },

                codeGeneration = {
                    generateComments = true,
                },

                configuration = {
                    runtimes = {
                        {
                            name = 'JavaSE-11',
                            path = '/usr/lib/jvm/java-11-openjdk-amd64/',
                        },
                    },
                },
            },
        },

        init_options = {
            extendedClientCapabilities = extendedClientCapabilities,
            bundles = {
                vim.fn.glob(
                    '/home/nguyenhoangnam/.local/share/dap/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar'
                ),
            },
        },
    }

    require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
        local opts = {}
        pickers.new(opts, {
            prompt_title = prompt,
            finder = finders.new_table({
                results = items,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = label_fn(entry),
                        ordinal = label_fn(entry),
                    }
                end,
            }),
            sorter = sorters.get_generic_fuzzy_sorter(),
            attach_mappings = function(prompt_bufnr)
                actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()

                    actions.close(prompt_bufnr)

                    cb(selection.value)
                end)

                return true
            end,
        }):find()
    end

    jdtls.start_or_attach(config)
end

return M
