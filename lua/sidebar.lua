local M = {
    sidebar_width = 30,
    sidebar_position = 'right',
    sidebar_title = {
        { filetype = 'Yanil', text = 'Explorer', text_align = 'left' },
        { filetype = 'aerial', text = 'Symbol', text_align = 'left' },
        { filetype = 'dapui_stacks', text = 'Debug', text_align = 'left' },
    },
}

M.sidebar_type = ''

local function toggle_sidebar(type)
    if type == 'explorer' then
        require('yanil/canvas').toggle()
    elseif type == 'symbol' then
        require('aerial').toggle()
    elseif type == 'debug' then
        require('dapui').toggle('sidebar')
    end
end

function M.toggle(type)
    if M.sidebar_type == '' then
        M.sidebar_type = type
    elseif M.sidebar_type == type then
        M.sidebar_type = ''
    else
        toggle_sidebar(M.sidebar_type)
        M.sidebar_type = type
    end

    toggle_sidebar(type)
end

return M
