local loop = vim.loop
local api = vim.api

local yanil = require('yanil')
local git = require('yanil/git')
local decorators = require('yanil/decorators')
local devicons = require('yanil/devicons')
local canvas = require('yanil/canvas')
local utils = require('yanil/utils')

local templates = require('utils.templates')

local function create_node(tree, node)
    node = node:is_dir() and node or node.parent
    local name = vim.fn.input(string.format(
        [[Enter the dir/file name to be created. Dirs end with a '/'
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

    local file_extension = require('utils.core').file_extension(name)
    local is_template_support = templates.file_supported(file_extension)

    local file_type = ''
    if file_extension == 'java' then
        file_type = vim.fn.input('\nEnter file type: [1] Class, [2] Interface: ')
    end

    -- 0644
    loop.fs_open(path, 'w+', 33188, function(err, fd)
        assert(not err, err)

        if is_template_support then
            local data = templates.generate(file_extension, name, node.abs_path, file_type)
            loop.fs_write(fd, data, function(write_err, _)
                assert(not write_err, write_err)

                loop.fs_close(fd, function(c_err, ok)
                    assert(not c_err and ok, 'create file failed')
                end)
            end)
        else
            loop.fs_close(fd, function(c_err, ok)
                assert(not c_err and ok, 'create file failed')
            end)
        end

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
            [[STOP! Directory is not empty! To delete, type 'yes'
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

local function rename_node(tree, node)
    local name = vim.fn.input([[New name: ]])
    local abs_path = node.abs_path

    local name_length = #abs_path - #node.name
    local abs_path_new = ''
    if node:is_dir() then
        abs_path_new = string.sub(abs_path, 1, name_length - 1) .. name .. '/'
    else
        abs_path_new = string.sub(abs_path, 1, name_length) .. name
    end

    local job_desc = {
        command = 'mv',
        args = { abs_path, abs_path_new },
        on_exit = function(_, code, _)
            if code ~= 0 then
                print('Rename node failed')
                return
            end
        end,
    }
    require('plenary/job'):new(job_desc):start()

    local refresh = vim.schedule_wrap(function()
        tree:force_refresh_node(node.parent)
        git.update(tree.cwd)
    end)
    refresh()
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
                '^%node_modules',
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
        ['n'] = rename_node,
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
