local map = vim.api.nvim_set_keymap

local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }

vim.g.mapleader = ' '

----------------------------------------
--
--
-- <Enter> (normal): Add new blank line
-- <Leader>h (normal): Move to left window
-- <Leader>l (normal): Move to right window
-- p (normal): Paste code with indent
-- jk (insert): Change to normal mode from insert mode
-- t (terminal): Change to normal mode from terminal mode
--
--
----------------------------------------

map('n', '<Enter>', 'o<Esc>', options)
map('n', '<Leader>h', '<C-w>h', options)
map('n', '<Leader>l', '<C-w>l', options)
map('n', 'p', 'p=`]', options)
map('i', 'jk', '<Esc>', options)
map('t', '<Esc>', '<C-\\><C-n>', options)

----------------------------------------
--
--
-- <Leader>q (normal): Turn off highlight
-- <Leader>s (normal): Save file
-- <Leader>w (normal): Close current buffer
--
--
----------------------------------------

map('n', '<Leader>q', [[<Cmd>let @/=""<CR>]], cmd_options)
map('n', '<Leader>s', [[:w<CR>]], cmd_options)
map('n', '<Leader>w', [[<Cmd>lua require('utils.core').bufdelete()<CR>]], cmd_options)
map('n', '<Leader>m', [[<Cmd>lua require('format').format()<CR>]], cmd_options)
map('v', '<Leader>c', [[<Cmd>lua require('format').range_format()<CR><Esc>]], cmd_options)
map('n', '<Leader>;', [[:lua require('utils.core').match_jump()<CR>]], cmd_options)

map('n', '<Leader>f', [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], cmd_options)
map('n', '<Leader>o', [[:lua require('telescope.builtin').buffers()<CR>]], cmd_options)
map('n', '<Leader>t', [[:lua require('telescope.builtin').lsp_document_diagnostics()<CR>]], cmd_options)
map('n', '<Leader>p', [[:lua require('telescope.builtin').find_files()<CR>]], cmd_options)
map('n', '<Leader>a', [[<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], cmd_options)
map('n', '<Leader>g', [[:lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>]], cmd_options)
map('n', '<Leader>e', [[:lua require('telescope.builtin').symbols{ sources = {'emoji'} }<CR>]], cmd_options)

map('n', '<Leader>/', [[<Cmd>CommentToggle<CR>]], cmd_options)
map('v', '<Leader>/', [[:CommentToggle<CR>]], cmd_options)

map('n', '<Leader>b', [[<Cmd>YanilToggle<CR>]], cmd_options)
map('v', '<Leader>b', [[<Cmd>YanilToggle<CR>]], cmd_options)

map('n', ']b', '<Cmd>BufferLineCycleNext<CR>', cmd_options)
map('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', cmd_options)
