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
	autocmd BufWritePost *.jsx,*.svelte,*.lua,*.js,*.rs,*.go,*py FormatWrite
augroup END
]],
	true
)
