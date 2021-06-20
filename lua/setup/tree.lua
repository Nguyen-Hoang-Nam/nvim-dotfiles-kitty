local g = vim.g
local augroup = vim.api.nvim_command

-- augroup([[autocmd BufWinEnter NvimTree let &1:stl='NvimTree']])

vim.o.termguicolors = true

g.nvim_tree_side = 'right'
g.nvim_tree_width = 30
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_auto_close = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_window_picker_exclude = {
	buftype = {
		"terminal"
	}
}
g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1
}
g.nvim_tree_icons = {
	default = " ",
	symlink = " ",
	git = {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★"
	},
	folder = {
		default = "",
		open = "",
		symlink = ""
	}
}

local get_lua_cb = function(cb_name)
	return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end
