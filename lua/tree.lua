local loop = vim.loop
local api = vim.api

local yanil = require('yanil')
local git = require('yanil/git')
local decorators = require('yanil/decorators')
local devicons = require('yanil/devicons')
local canvas = require('yanil/canvas')
local utils = require('yanil/utils')

local function create_node(tree, node)
    node = node:is_dir() and node or node.parent
    local name = vim.fn.input(string.format(
        [[Add a childnode
        ==========================================================
        Enter the dir/file name to be created. Dirs end with a '/'
        %s]],
        node.abs_path
    ))
    if not name or name == '' then
        return
    end
    local path = node.abs_path .. name

    -- checking file exists in schedule function to make input prompt close
    vim.schedule(function()
        if tree.root:find_node_by_path(path) then
            print('path', path, 'is already exists')
            return
        end
    end)

    local refresh = vim.schedule_wrap(function()
        tree:force_refresh_node(node)
        git.update(tree.cwd)
    end)

    if vim.endswith(path, '/') then
        -- 0755
        loop.fs_mkdir(path, 16877, function(err, ok)
            assert(not err, err)
            assert(ok, 'mkdir failed')
            refresh()
        end)
        return
    end

    -- 0644
    loop.fs_open(path, 'w+', 33188, function(err, fd)
        assert(not err, err)

        local file_type = require('utils').file_type(name)
        if file_type == 'java' then
            print('java')
        elseif file_type == 'md' then
            print('markdown')
        elseif file_type == 'html' then
            print('html')
        end

        loop.fs_close(fd, function(c_err, ok)
            assert(not c_err and ok, 'create file failed')
        end)
        refresh()
    end)
end

local function clear_buffer(path)
    for _, bufnr in ipairs(api.nvim_list_bufs()) do
        if path == api.nvim_buf_get_name(bufnr) then
            api.nvim_buf_delete(bufnr, { force = true })
            return
        end
    end
end

local function delete_node(tree, node)
    if node == tree.root then
        print('You can NOT delete the root')
        return
    end
    if node:is_dir() then
        node:load()
    end
    if node:is_dir() and #node.entries > 0 then
        local answer = vim.fn.input(string.format(
            [[Delete the current node
            ==========================================================
            STOP! Directory is not empty! To delete, type 'yes'
            %s: ]],
            node.abs_path
        ))
        if answer:lower() ~= 'yes' then
            return
        end
    end

    local job_desc = {
        command = 'rm',
        args = { '-rf', node.abs_path },
        on_exit = function(_, code, _)
            if code ~= 0 then
                print('delete node failed')
                return
            end

            vim.schedule(function()
                clear_buffer(node.abs_path)
                local parent = node.parent
                tree:force_refresh_node(parent)
                git.update(tree.cwd)
            end)
        end,
    }
    require('plenary/job'):new(job_desc):start()
end

yanil.setup()

local tree = require('yanil/sections/tree'):new()

tree:setup({
    draw_opts = {
        decorators = {
            left = {
                decorators.pretty_indent,
                devicons.decorator(),
                decorators.space,
                decorators.default,
                decorators.executable,
                decorators.readonly,
                decorators.link_to,
            },
            right = git.decorator(),
        },
    },

    filters = {
        function(name)
            local patterns = {
                '^%.git$',
                '%.pyc',
                '^__pycache__$',
                '^%.idea$',
                '^%.iml$',
                '^%.DS_Store$',
                '%.o$',
                '%.d$',
            }
            for _, pat in ipairs(patterns) do
                if string.find(name, pat) then
                    return true
                end
            end
        end,
    },

    keymaps = {
        [']c'] = git.jump_next,
        ['[c'] = git.jump_prev,
        ['a'] = create_node,
        ['d'] = delete_node,
    },
})

canvas.register_hooks({
    on_enter = function()
        git.update(tree.cwd)
        utils.buf_set_keymap(canvas.bufnr, 'n', 'q', function()
            vim.fn.execute('quit')
        end)
    end,
})

canvas.setup({
    sections = {
        tree,
    },

    autocmds = {
        {
            event = 'User',
            pattern = 'YanilGitStatusChanged',
            cmd = function()
                git.refresh_tree(tree)
            end,
        },
    },
})
