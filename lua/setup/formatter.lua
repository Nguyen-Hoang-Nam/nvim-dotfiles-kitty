require('formatter').setup({
	logging = false,
	filetype = {
		javascript = {
			function()
				return {
					exe = 'prettier',
					args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0), '--single-quote' },
					stdin = true,
				}
			end,
		},
		rust = {
			function()
				return { exe = 'rustfmt', args = { '--emit=stdout' }, stdin = true }
			end,
		},
		lua = {
			function()
				return {
					exe = 'stylua',
					args = {
						'--stdin-filepath',
						vim.api.nvim_buf_get_name(0),
						'--config-path',
						'~/.config/stylua/stylua.toml',
					},
					stdin = false,
				}
			end,
		},
		go = {
			function()
				return { exe = 'goimports', stdin = true }
			end,
			function()
				return { exe = 'gofumpt', stdin = true }
			end,
		},
		python = {
			function()
				return { exe = 'black', args = { '-q', '-' }, stdin = true }
			end,
		},
		svelte = {
			function()
				return {
					exe = 'prettier',
					args = {
						'--stdin-filepath',
						vim.api.nvim_buf_get_name(0),
						'--plugin-search-dir',
						'.',
					},
					stdin = true,
				}
			end,
		},
	},
})
