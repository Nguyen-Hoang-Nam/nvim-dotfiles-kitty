local M = {
	fileType = '',
	format = '',
	lineBreak = '',
	tab = vim.api.nvim_eval('&tabstop'),
}

local format = {
	javascript = 'Prettier Tssever',
	typescript = 'Prettier Tssever',
	svelte = 'Pretter-Plugin-Svelte',
	go = 'Goimports Gofumpt',
	rust = 'Rustfmt Rust-Analyzer',
	lua = 'Stylua',
}

function M.update()
	local fileType = vim.bo.filetype
	local lineBreak = vim.go.fileformat
	if fileType ~= '' then
		M.tab = vim.api.nvim_eval('&tabstop')

		M.fileType = fileType:gsub('^%l', string.upper) .. '   '
		if format[fileType] then
			M.format = format[fileType] .. '   '
		end

		if lineBreak == 'unix' then
			M.lineBreak = 'LF   '
		elseif lineBreak == 'mac' then
			M.lineBreak = 'CR   '
		else
			M.lineBreak = 'CRLF   '
		end
	end
end

return M
