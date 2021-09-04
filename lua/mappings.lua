local map = vim.api.nvim_set_keymap

local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }
-- local expression = { expr = true, silent = true }

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
-- <M-j> (insert): Move line down
-- <M-k> (insert): Move line up
--
--
----------------------------------------

-- map('n', '<Leader>q', [[:xa<CR>]], cmd_options)
map('n', '<Leader>q', [[<Cmd>let @/=""<CR>]], cmd_options)
map('n', '<Leader>s', [[:w<CR>]], cmd_options)
map('n', '<Leader>w', [[<Cmd>lua require('utils.core').bufdelete()<CR>]], cmd_options)
map('i', '<M-j>', [[<Esc>:m .+1<CR>==gi]], cmd_options)
map('i', '<M-k>', [[<Esc>:m .-2<CR>==gi]], cmd_options)
map('n', '<M-j>', [[<Esc>:m .+1<CR>==gi]], cmd_options)
map('n', '<M-k>', [[<Esc>:m .-2<CR>==gi]], cmd_options)
map('n', '<Leader>m', [[<Cmd>lua require('format').choose_formatter()<CR>]], cmd_options)
map('n', '<Leader>;', [[:lua require('utils.core').match_jump()<CR>]], cmd_options)

----------------------------------------
--
--
-- Nvim-Telescope
--
-- <Leader>f (normal): Find texts in current buffer
-- <Leader>p (normal): Find files in current project
-- <Leader>a (normal): Code action
-- <Leader>o (normal): File buffers in current project
-- <Leader>c (normal): Find git's commits
-- <Leader>g (normal): Find gitmojis
--
--
----------------------------------------

map('n', '<Leader>f', [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], cmd_options)
map('n', '<Leader>o', [[:lua require('telescope.builtin').buffers()<CR>]], cmd_options)
map('n', '<Leader>t', [[:lua require('telescope.builtin').lsp_document_diagnostics()<CR>]], cmd_options)
map('n', '<Leader>p', [[:lua require('telescope.builtin').find_files()<CR>]], cmd_options)
-- map('n', '<Leader>c', [[<Cmd>lua require('telescope.builtin').git_commits()<CR>]], cmd_options)
map('n', '<Leader>a', [[<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], cmd_options)
map('n', '<Leader>g', [[:lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>]], cmd_options)
map('n', '<Leader>e', [[:lua require('telescope.builtin').symbols{ sources = {'emoji'} }<CR>]], cmd_options)

----------------------------------------
--
--
-- Nvim-Comment
--
-- <Leader>/ (normal): Comment current line
-- <Leader>/ (visual): Comment selected lines
--
--
----------------------------------------

map('n', '<Leader>/', [[<Cmd>CommentToggle<CR>]], cmd_options)
map('v', '<Leader>/', [[:CommentToggle<CR>]], cmd_options)

----------------------------------------
--
--
-- Nvim-Tree
--
-- <Leader>b (normal): Open File Explorer
-- <Leader>b (visual): Open File Explorer
--
--
----------------------------------------

map('n', '<Leader>b', [[<Cmd>YanilToggle<CR>]], cmd_options)
map('v', '<Leader>b', [[<Cmd>YanilToggle<CR>]], cmd_options)

map('n', '<Leader>c', [[<Cmd>DogeGenerate<CR>]], cmd_options)

map('n', ']b', '<Cmd>BufferLineCycleNext<CR>', cmd_options)
map('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', cmd_options)
