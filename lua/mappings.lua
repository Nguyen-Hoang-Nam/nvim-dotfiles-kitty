local map = vim.api.nvim_set_keymap

local telescope = require("telescope.builtin")
local utils_core = require("utils.core")
local format = require("format")
local dap = require("dap")
local goto_preview = require("goto-preview")
local utils_dap = require("utils.dap")
local sidebar = require("sidebar")

local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }

local function cmd_option(callback)
    return { noremap = true, silent = true, callback = callback }
end

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

map("n", "<Leader>q", [[<Cmd>let @/=""<CR>]], cmd_options)
map("n", "<Leader>s", [[:silent write<CR>]], cmd_options)
map("n", "<Leader>w", "", cmd_option(require("utils.bufdelete").bufdelete))

map("n", "<Leader>m", "", cmd_option(format.format))
map("n", "<Leader>c", "", cmd_option(format.range_format))

map(
    "n",
    "<Leader>f",
    "",
    cmd_option(function()
        telescope.current_buffer_fuzzy_find({ skip_empty_lines = true })
    end)
)
map("n", "<Leader>o", "", cmd_option(telescope.buffers))
map("n", "<Leader>p", "", cmd_option(utils_core.project_files))
map("n", "<Leader>u", "", cmd_option(telescope.live_grep))
map(
    "n",
    "<Leader>e",
    "",
    cmd_option(function()
        telescope.symbols({ sources = { "gitmoji" } })
    end)
)

map("n", "<Leader>g", "", cmd_option(utils_core.git_hover))

-- Dap
map("n", "<Leader>0", "", cmd_option(utils_dap.toggle_breakpoint))
map("n", "<Leader>1", "", cmd_option(utils_dap.toggle_debug))
map("n", "<Leader>2", "", cmd_option(dap.step_over))
map("n", "<Leader>3", "", cmd_option(dap.step_into))
map("n", "<Leader>4", "", cmd_option(dap.step_out))
map(
    "n",
    "<Leader>9",
    "",
    cmd_option(function()
        require("dapui").float_element("scopes", {})
    end)
)

map("n", "<Leader>t", "", cmd_option(utils_core.toggle_test))
map("n", "]t", "<Plug>(ultest-next-fail)", { noremap = false, silent = true })
map("n", "[t", "<Plug>(ultest-prev-fail)", { noremap = false, silent = true })

-- Sidebar
map(
    "n",
    "<M-b>",
    "",
    cmd_option(function()
        sidebar.toggle("explorer")
    end)
)
map(
    "n",
    "<M-d>",
    "",
    cmd_option(function()
        sidebar.toggle("debug")
    end)
)

map("n", "<Leader>/", [[<Cmd>CommentToggle<CR>]], cmd_options)
map("v", "<Leader>/", [[:CommentToggle<CR>]], cmd_options)

map("n", "]b", "<Cmd>BufferLineCycleNext<CR>", cmd_options)
map("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", cmd_options)

map("n", "]q", "<Cmd>tabn<CR>", cmd_options)
map("n", "[q", "<Cmd>tabp<CR>", cmd_options)

map("n", "<Leader>z", "", cmd_option(goto_preview.goto_preview_definition))

map("n", "<M-r>", "", cmd_option(utils_core.rest))

map("n", "<M-s>", "", cmd_option(utils_core.sql))

map("n", "<Leader>n", "<Cmd>FineCmdline<CR>", cmd_options)

map("n", "ck", "<Plug>(git-conflict-ours)", cmd_options)
map("n", "cj", "<Plug>(git-conflict-theirs)", cmd_options)
map("n", "cb", "<Plug>(git-conflict-both)", cmd_options)
map("n", "c0", "<Plug>(git-conflict-none)", cmd_options)
map("n", "]g", "<Plug>(git-conflict-prev-conflict)", cmd_options)
map("n", "[g", "<Plug>(git-conflict-next-conflict)", cmd_options)
