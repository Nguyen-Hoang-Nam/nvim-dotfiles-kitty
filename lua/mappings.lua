local map = vim.api.nvim_set_keymap

local options = {noremap = true}
local cmd_options = {noremap = true, silent = true}

vim.g.mapleader = " "

map('n', '<Enter>', 'o<Esc>', options)
map('n', '<Leader>c', '<C-w>w', options)
map('n', '<Leader>h', '<C-w>h', options)
map('n', '<Leader>l', '<C-w>l', options)
map('n', 'p', 'p=`]', options)
map('i', 'jk', '<Esc>', options)
map('v', 'e', '<Esc>', options)
map('t', '<Esc>', '<C-\\><C-n>', options)

----------------------------------------
--
-- Commands
--
----------------------------------------
map('n', '<M-d>', [[:lua require('nvim-dictionary').get_dictionary()<CR>]],
    options)
map('v', '<M-d>', [[<Cmd>lua require('nvim-dictionary').get_dictionary()<CR>]],
    options)

map('n', '<Leader>q', [[<Cmd>xa<CR>]], cmd_options)
map('n', '<Leader>s', [[<Cmd>let @/=""<CR>]], cmd_options)
map('n', '<Leader>w', [[<Cmd>w<CR>]], cmd_options)
map('n', '<Leader>a', [[<Cmd>wa<CR>]], cmd_options)
map('n', '<Leader>d', [[<Cmd>b# | bd#<CR>]], cmd_options)
map('n', '<Leader>d', [[<Cmd>lua require('bufdelete').bufdelete(0, true)<CR>]],
    cmd_options)
map('n', '<Leader>n', [[<Cmd>edit \[No Name\]<CR>]], cmd_options)

map('i', '<M-j>', [[<Esc>:m .+1<CR>==gi]], cmd_options)
map('i', '<M-k>', [[<Esc>:m .-2<CR>==gi]], cmd_options)

map('n', '<Leader>f',
    [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
    cmd_options)
map('n', '<Leader>p',
    [[:lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<CR>]],
    cmd_options)
map('n', '<Leader>o', [[:lua require('telescope.builtin').oldfiles()<CR>]],
    cmd_options)
map('n', '<Leader>g',
    [[<Cmd>lua require('telescope.builtin').git_commits()<CR>]], cmd_options)
map('n', '<Leader>e',
    [[<Cmd>lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>]],
    cmd_options)
map('n', '<Leader>m',
    [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]],
    cmd_options)

map('n', '<Leader>/', [[<Cmd>CommentToggle<CR>]], cmd_options)
map('v', '<Leader>/', [[:CommentToggle<CR>]], cmd_options)

map('n', '<Leader>b', [[<Cmd>NvimTreeToggle<CR>]], cmd_options)
map('v', '<Leader>b', [[<Cmd>NvimTreeToggle<CR>]], cmd_options)

map('n', '<Leader>r', [[<Cmd>Glow<CR>]], cmd_options)

map('n', '<Leader>t', [[<Cmd>LspTroubleToggle<CR>]], cmd_options)
