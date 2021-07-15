local lsp = require('../lsp')

local sumneko_root_path = '/home/nguyenhoangnam/.local/share/dev/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup({
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
	cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = runtime_path,
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				maxPreload = 2000,
				preloadFileSize = 150,
				library = vim.api.nvim_get_runtime_file('', true),
			},
			telemetry = {
				enable = false,
			},
			completion = {
				keywordSnippet = 'Disable',
			},
		},
	},
})
