local function check_mix_lang()
    local file_type = vim.api.nvim_buf_get_option(0, 'filetype')

    return file_type == 'tsx' or file_type == 'svelte' or file_type == 'vue' or file_type == 'html'
end

require('nvim_comment').setup({
    comment_empty = false,
    create_mappings = false,
    hook = function()
        if check_mix_lang() then
            require('ts_context_commentstring.internal').update_commentstring()
        end
    end,
})
