local map = vim.api.nvim_set_keymap

local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }

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
map('n', '<Leader>w', [[<Cmd>lua require('utils.core').bufdelete()<CR>]], cmd_options)

map('n', '<Leader>m', [[<Cmd>lua require('format').format()<CR>]], cmd_options)
map('v', '<Leader>c', [[<Cmd>lua require('format').range_format()<CR><Esc>]], cmd_options)

map('n', '<Leader>f', [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], cmd_options)
-- map('n', '<Leader>o', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], cmd_options)
map('n', '<Leader>p', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], cmd_options)
map('n', '<Leader>a', [[<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], cmd_options)
map('n', '<Leader>e', [[<Cmd>lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>]], cmd_options)
map('n', '<Leader>x', [[<Cmd>lua require('telescope.builtin').registers()<CR>]], cmd_options)

map('n', '<Leader>g', [[<Cmd>lua require("utils.core").git_hover()<CR>]], cmd_options)

map('n', '<Leader>1', [[:lua require('jdtls.dap').setup_dap_main_class_configs()<CR>]], cmd_options)
map('n', '<Leader>2', [[:lua require'dap'.continue()<CR>]], cmd_options)
map('n', '<Leader>3', [[:lua require'dap'.disconnect()<CR>]], cmd_options)
map('n', '<Leader>4', [[:lua require'dap'.step_over()<CR>]], cmd_options)
map('n', '<Leader>5', [[:lua require'dap'.step_into()<CR>]], cmd_options)
map('n', '<Leader>6', [[:lua require'dap'.step_out()<CR>]], cmd_options)
map('n', '<Leader>8', [[:lua require'dapui'.float_element("scopes")<CR>]], cmd_options)
map('n', '<Leader>9', [[:lua require'dapui'.toggle("sidebar")<CR>]], cmd_options)
map('n', '<Leader>0', [[:lua require'dap'.toggle_breakpoint()<CR>]], cmd_options)

map('n', '<Leader>/', [[<Cmd>CommentToggle<CR>]], cmd_options)
map('v', '<Leader>/', [[:CommentToggle<CR>]], cmd_options)

map('n', '<Leader>b', [[<Cmd>YanilToggle<CR>]], cmd_options)
map('v', '<Leader>b', [[<Cmd>YanilToggle<CR>]], cmd_options)

map('n', ']b', '<Cmd>BufferLineCycleNext<CR>', cmd_options)
map('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', cmd_options)

map('n', '<Leader>z', [[<Cmd>lua require('goto-preview').goto_preview_definition()<CR>]], cmd_options)
