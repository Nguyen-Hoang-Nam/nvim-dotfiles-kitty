local lsp = require("languages.lsp")

return {
    lsp_server = "sqls",

    lsp = {
        capabilities = lsp.capabilities,
        on_attach = function(client, bufnr)
            require("sqls").on_attach(client, bufnr)
            require("nvim-navic").attach(client, bufnr)
        end,

        root_dir = function()
            return vim.fn.getcwd()
        end,
    },
}
