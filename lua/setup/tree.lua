local g = vim.g

g.nvim_tree_side = 'right'
g.nvim_tree_ignore = { '.git', 'node_modules' }
g.nvim_tree_auto_ignore_ft = { 'dashboard' }
g.nvim_tree_indent_markers = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ':t'
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_special_files = {}
g.nvim_tree_window_picker_exclude = {
    buftype = {
        'terminal',
    },
}

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = ' M',
        staged = ' A',
        unmerged = '',
        renamed = ' R',
        untracked = ' U',
        deleted = ' D',
        ignored = ' I',
    },

    folder = {
        arrow_open = '',
        arrow_closed = '',
        default = '',
        open = '',
        empty = '',
        empty_open = '',
        symlink = '',
        symlink_open = '',
    },

    lsp = {
        hint = '',
        info = '',
        warning = '',
        error = '',
    },
}
