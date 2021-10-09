local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local pickers = require('telescope.pickers')

local java = require('languages.java')

local M = {}

-- local root_markers = { 'gradlew', 'pom.xml' }
-- local root_dir = require('jdtls.setup').find_root(root_markers)
-- local home = os.getenv('HOME')
-- local workspace_folder = home .. '/.local/share/java/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

-- local workspace_folder = home .. '/.local/share/java'

function M.setup()
    local config = {
        flags = {
            -- allow_incremental_sync = true,
            server_side_fuzzy_completion = true,
        },
        -- capabilities = java.lsp.capabilities,
        -- on_attach = java.lsp.on_attach,
    }

    local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    config.init_options = {
        extendedClientCapabilities = extendedClientCapabilities,
    }

    config.settings = {
        -- ['java.format.settings.url'] = home .. '/.config/nvim/language-servers/java-google-formatter.xml',
        -- ['java.format.settings.profile'] = 'GoogleStyle',
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            completion = {
                favoriteStaticMembers = {
                    -- 'org.hamcrest.MatcherAssert.assertThat',
                    -- 'org.hamcrest.Matchers.*',
                    -- 'org.hamcrest.CoreMatchers.*',
                    -- 'org.junit.jupiter.api.Assertions.*',
                    -- 'java.util.Objects.requireNonNull',
                    -- 'java.util.Objects.requireNonNullElse',
                    -- 'org.mockito.Mockito.*',
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                generateComments = true,
                -- toString = {
                --     template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
                -- },
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
    }

    -- config.cmd = { 'java-lsp.sh', workspace_folder }
    config.cmd = { 'java-lsp.sh' }
    config.on_attach = java.lsp.on_attach

    config.on_init = function(client, _)
        client.notify('workspace/didChangeConfiguration', { settings = config.settings })
    end

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
                    local selection = actions.get_selected_entry()
                    actions.close(prompt_bufnr)

                    cb(selection.value)
                end)

                return true
            end,
        }):find()
    end

    -- Server
    require('jdtls').start_or_attach(config)
end

return M
