local map = vim.api.nvim_set_keymap

local telescope = require('telescope.builtin')
local utils_core = require('utils.core')
local format = require('format')
local dap = require('dap')
local goto_preview = require('goto-preview')
local utils_dap = require('utils.dap')

local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }

local function cmd_option(callback)
    return { noremap = true, silent = true, callback = callback }
end

vim.g.mapleader = ' '

map('n', '<Enter>', 'o<Esc>', options)
map('n', '<Leader>h', '<C-w>h', options)
map('n', '<Leader>l', '<C-w>l', options)
map('n', '<Leader>j', '<C-w>j', options)
map('n', '<Leader>k', '<C-w>k', options)
map('n', 'p', 'p=`]', options)
map('i', 'jk', '<Esc>', options)
map('t', '<Esc>', '<C-\\><C-n>', options)
map('v', '<Tab>', '>gV', options)
map('v', '<S-Tab>', '<gV', options)

map('n', '<Leader>q', [[<Cmd>let @/=""<CR>]], cmd_options)
map('n', '<Leader>s', [[:w<CR>]], cmd_options)
map('n', '<Leader>w', '', cmd_option(utils_core.bufdelete))

map('n', '<Leader>m', '', cmd_option(format.format))
map('n', '<Leader>c', '', cmd_option(format.range_format))

map(
    'n',
    '<Leader>f',
    [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({skip_empty_lines = true})<CR>]],
    cmd_options
)
map('n', '<Leader>o', '', cmd_option(telescope.buffers))
map('n', '<Leader>p', '', cmd_option(telescope.find_files))
map('n', '<Leader>a', '', cmd_option(telescope.lsp_code_actions))
map('n', '<Leader>e', [[<Cmd>lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>]], cmd_options)

map('n', '<Leader>g', '', cmd_option(utils_core.git_hover))

-- Dap
map('n', '<Leader>0', '', cmd_option(utils_dap.toggle_breakpoint))
map('n', '<Leader>1', '', cmd_option(utils_dap.toggle_debug))
map('n', '<Leader>2', '', cmd_option(dap.step_over))
map('n', '<Leader>3', '', cmd_option(dap.step_into))
map('n', '<Leader>4', '', cmd_option(dap.step_out))
map('n', '<Leader>9', [[<Cmd>lua require'dapui'.float_element("scopes")<CR>]], cmd_options)

-- Sidebar
map('n', '<Leader>b', [[<Cmd>lua require'sidebar'.toggle('explorer')<CR>]], cmd_options)
map('n', '<Leader>u', [[<Cmd>lua require'sidebar'.toggle('debug')<CR>]], cmd_options)

map('n', '<Leader>/', [[<Cmd>CommentToggle<CR>]], cmd_options)
map('v', '<Leader>/', [[:CommentToggle<CR>]], cmd_options)

map('n', ']b', '<Cmd>BufferLineCycleNext<CR>', cmd_options)
map('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', cmd_options)

map('n', '<Leader>z', '', cmd_option(goto_preview.goto_preview_definition))

map('n', '<Leader>v', '', cmd_option(require('rest-nvim').run))
map('n', '<M-r>', '', cmd_option(utils_core.rest))
