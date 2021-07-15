local augroup = vim.api.nvim_exec

augroup(
	[[
augroup Terminal
	autocmd!
	autocmd TermOpen * setlocal nonumber
	autocmd TermOpen * setlocal norelativenumber
augroup END
]],
	true
)

augroup(
	[[
augroup Config
	autocmd!
	autocmd InsertEnter * set nocursorline
	autocmd InsertLeave * set cursorline
	autocmd VimEnter * set formatoptions-=cro
	autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif
augroup END
]],
	true
)

augroup(
	[[
augroup FormatAutogroup
	autocmd!
	autocmd BufWritePre *.py,*.js,*.jsx,*.ts,*.svelte,*.go,*.lua,*.rs,*.tex,*.css,*.html,*.yaml,*.yml,*.json lua vim.lsp.buf.formatting_seq_sync()
augroup END
]],
	true
)

augroup(
	[[
augroup UpdateGlobal
	autocmd!
	autocmd BufEnter * lua require('global').update()
	autocmd FileType markdown setlocal spell
	autocmd BufRead,BufNewFile *.md setlocal spell
augroup END
]],
	true
)
