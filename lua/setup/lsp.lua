local lspconfig = require('lspconfig')
local config = require('lspconfig/configs')

vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.lsp.omnifunc")

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

lspconfig.html.setup {
	capabilities = capabilities,
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end
}

lspconfig.cssls.setup {
	capabilities = capabilities,
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end
}

lspconfig.yamlls.setup {
	capabilities = capabilities,
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end
}

lspconfig.dockerls.setup {
	capabilities = capabilities,
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end
}

lspconfig.tsserver.setup {
	capabilities = capabilities,
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end
}

lspconfig.svelte.setup {
	capabilities = capabilities,
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end
}

lspconfig.gopls.setup {
	capabilities = capabilities,
	cmd = {"gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
		},
		staticcheck = true,
	},
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end,
}

lspconfig.pyright.setup {
	capabilities = capabilities,
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end
}

lspconfig.rust_analyzer.setup {
	capabilities = capabilities,
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end,
	settings = {
		["rust_analyzer"] = {
			cargo = {
				loadOutDirsFromCheck = true
			}
		}
	}
}

local sumneko_root_path = '$HOME/.local/share/dev/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
	capabilities = capabilities,
	on_attach = function(client)
		require('illuminate').on_attach(client)
	end,
	cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = runtime_path,
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
