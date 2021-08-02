local utils = require('utils')
local map = utils.map

local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }
local expression = { expr = true, silent = true }

vim.g.mapleader = ' '

----------------------------------------
--
--
-- <Enter> (normal): Add new blank line
-- <Leader>h (normal): Move to left window
-- <Leader>l (normal): Move to right window
-- p (normal): Paste code with indent
-- jk (insert): Change to normal mode from insert mode
-- e (visual): Change to normal mode from visual mode
-- t (terminal): Change to normal mode from terminal mode
--
--
----------------------------------------

map('n', '<Enter>', 'o<Esc>', options)
map('n', '<Leader>h', '<C-w>h', options)
map('n', '<Leader>l', '<C-w>l', options)
map('n', 'p', 'p=`]', options)
map('i', 'jk', '<Esc>', options)
map('v', 'e', '<Esc>', options)
map('t', '<Esc>', '<C-\\><C-n>', options)

----------------------------------------
--
--
-- <Leader>q (normal): Turn off highlight
-- <Leader>s (normal): Save file
-- <Leader>w (normal): Close current buffer
-- <Leader>n (normal): New file
-- <M-j> (insert): Move line down
-- <M-k> (insert): Move line up
--
--
----------------------------------------

-- map('n', '<Leader>q', [[:xa<CR>]], cmd_options)
map('n', '<Leader>q', [[<Cmd>let @/=""<CR>]], cmd_options)
map('n', '<Leader>s', [[:w<CR>]], cmd_options)
map('n', '<Leader>w', [[<Cmd>lua require('bufdelete').bufdelete(0, true)<CR>]], cmd_options)
map('n', '<Leader>n', [[<Cmd>edit \[No Name\]<CR>]], cmd_options)
map('i', '<M-j>', [[<Esc>:m .+1<CR>==gi]], cmd_options)
map('i', '<M-k>', [[<Esc>:m .-2<CR>==gi]], cmd_options)
map('n', '<M-j>', [[<Esc>:m .+1<CR>==gi]], cmd_options)
map('n', '<M-k>', [[<Esc>:m .-2<CR>==gi]], cmd_options)

----------------------------------------
--
--
-- Nvim-Compe
--
-- <Tab> (insert): Choose the next option
-- <Tab> (select): Choose the next option
-- <S-Tab> (insert): Choose the previous option
-- <S-Tab> (select): Choose the previous option
-- <M-e> (insert): Trigger completion for emmet
--
--
----------------------------------------

map('i', '<Tab>', 'v:lua.tab_complete()', expression)
map('s', '<Tab>', 'v:lua.tab_complete()', expression)
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', expression)
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', expression)
map('i', '<M-e>', [[compe#complete()]], { noremap = true, silent = true, expr = true })

----------------------------------------
--
--
-- Nvim-Telescope
--
-- <Leader>f (normal): Find texts in current buffer
-- <Leader>p (normal): Find files in current project
-- <Leader>r (normal): Find buffers in current project
-- <Leader>o (normal): Find old files
-- <Leader>c (normal): Find git's commits
-- <Leader>g (normal): Find gitmojis
--
--
----------------------------------------

map('n', '<Leader>f', [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], cmd_options)
map('n', '<Leader>r', [[:lua require('telescope.builtin').buffers()<CR>]], cmd_options)
map(
    'n',
    '<Leader>p',
    [[:lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<CR>]],
    cmd_options
)
map('n', '<Leader>o', [[:lua require('telescope.builtin').oldfiles()<CR>]], cmd_options)
map('n', '<Leader>c', [[<Cmd>lua require('telescope.builtin').git_commits()<CR>]], cmd_options)
map('n', '<Leader>g', [[:lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>]], cmd_options)

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

map('n', '<Leader>b', [[<Cmd>NvimTreeToggle<CR>]], cmd_options)
map('v', '<Leader>b', [[<Cmd>NvimTreeToggle<CR>]], cmd_options)

----------------------------------------
--
--
-- Nvim-Trouble
--
-- <Leader>t (normal): Open Error list
--
--
----------------------------------------

map('n', '<Leader>t', [[<Cmd>LspTroubleToggle<CR>]], cmd_options)
