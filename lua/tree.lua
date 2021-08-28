local vim = vim

local yanil = require('yanil')
local git = require('yanil/git')
local decorators = require('yanil/decorators')
local devicons = require('yanil/devicons')
local canvas = require('yanil/canvas')
local utils = require('yanil/utils')

yanil.setup()

local tree = require('yanil/sections/tree'):new()

tree:setup({
    draw_opts = {
        decorators = {
            left = {
                decorators.pretty_indent,
                devicons.decorator(),
                decorators.space,
                decorators.default,
                decorators.executable,
                decorators.readonly,
                decorators.link_to,
            },
            right = git.decorator(),
        },
    },

    filters = {
        function(name)
            local patterns = {
                '^%.git$',
                '%.pyc',
                '^__pycache__$',
                '^%.idea$',
                '^%.iml$',
                '^%.DS_Store$',
                '%.o$',
                '%.d$',
            }
            for _, pat in ipairs(patterns) do
                if string.find(name, pat) then
                    return true
                end
            end
        end,
    },

    keymaps = {
        [']c'] = git.jump_next,
        ['[c'] = git.jump_prev,
    },
})

canvas.register_hooks({
    on_enter = function()
        git.update(tree.cwd)
        utils.buf_set_keymap(canvas.bufnr, 'n', 'q', function()
            vim.fn.execute('quit')
        end)
    end,
})

canvas.setup({
    sections = {
        tree,
    },

    autocmds = {
        {
            event = 'User',
            pattern = 'YanilGitStatusChanged',
            cmd = function()
                git.refresh_tree(tree)
            end,
        },
    },
})
