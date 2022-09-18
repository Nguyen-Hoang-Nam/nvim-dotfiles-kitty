local map = vim.keymap.set

local telescope = require("telescope.builtin")
local utils_core = require("utils.core")
local format = require("format")
local dap = require("dap")
local goto_preview = require("goto-preview")
local utils_dap = require("utils.dap")
local sidebar = require("sidebar")

local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<Enter>", "o<Esc>", options)
map("n", "gh", "<C-w>h", options)
map("n", "gl", "<C-w>l", options)
map("n", "gj", "<C-w>j", options)
map("n", "gk", "<C-w>k", options)
map("n", "p", "p=`]", options)
map("i", "jk", "<Esc>", options)
map("t", "<Esc>", "<C-\\><C-n>", options)
map("v", "<Tab>", ">gV", options)
map("v", "<S-Tab>", "<gV", options)
map("n", "[[", "<C-o>", options)
map("n", "]]", "<C-i>", options)

map("n", "<Leader>s", [[:silent write<CR>]], cmd_options)
map("n", "<Leader>w", require("utils.bufdelete").bufdelete, cmd_options)

map("n", "<Leader>m", format.format, cmd_options)
map("n", "<Leader>c", format.range_format, cmd_options)

map("n", "<Leader>f", function()
    telescope.current_buffer_fuzzy_find({ skip_empty_lines = true })
end, cmd_options)
map("n", "<Leader>o", telescope.buffers, cmd_options)
map("n", "<Leader>p", utils_core.project_files, cmd_options)
map("n", "<Leader>u", telescope.live_grep, cmd_options)
map("n", "<Leader>e", function()
    telescope.symbols({ sources = { "gitmoji" } })
end, cmd_options)

map("n", "<Leader>g", utils_core.git_hover, cmd_options)

-- Dap
map("n", "<Leader>0", utils_dap.toggle_breakpoint, cmd_options)
map("n", "<Leader>1", utils_dap.toggle_debug, cmd_options)
map("n", "<Leader>2", dap.step_over, cmd_options)
map("n", "<Leader>3", dap.step_into, cmd_options)
map("n", "<Leader>4", dap.step_out, cmd_options)
map("n", "<Leader>9", function()
    require("dapui").float_element("scopes", {})
end, cmd_options)

map("n", "<Leader>t", utils_core.toggle_test)
map("n", "]t", "<Plug>(ultest-next-fail)", { noremap = false, silent = true })
map("n", "[t", "<Plug>(ultest-prev-fail)", { noremap = false, silent = true })

-- Sidebar
map("n", "<M-b>", function()
    sidebar.toggle("explorer")
end, cmd_options)
map("n", "<M-d>", function()
    sidebar.toggle("debug")
end, cmd_options)

map("n", "<Leader>/", [[<Cmd>CommentToggle<CR>]], cmd_options)
map("v", "<Leader>/", [[:CommentToggle<CR>]], cmd_options)

map("n", "]b", "<Cmd>BufferLineCycleNext<CR>", cmd_options)
map("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", cmd_options)

map("n", "]q", "<Cmd>tabn<CR>", cmd_options)
map("n", "[q", "<Cmd>tabp<CR>", cmd_options)

map("n", "<Leader>z", goto_preview.goto_preview_definition, cmd_options)

map("n", "<M-r>", utils_core.rest, cmd_options)

map("n", "<M-s>", utils_core.sql, cmd_options)

map("n", "<Leader>n", "<Cmd>FineCmdline<CR>", cmd_options)

map("n", "ck", "<Plug>(git-conflict-ours)", cmd_options)
map("n", "cj", "<Plug>(git-conflict-theirs)", cmd_options)
map("n", "cb", "<Plug>(git-conflict-both)", cmd_options)
map("n", "c0", "<Plug>(git-conflict-none)", cmd_options)
map("n", "]g", "<Plug>(git-conflict-prev-conflict)", cmd_options)
map("n", "[g", "<Plug>(git-conflict-next-conflict)", cmd_options)

map("n", "zR", require("ufo").openAllFolds, cmd_options)
map("n", "zM", require("ufo").closeAllFolds, cmd_options)
