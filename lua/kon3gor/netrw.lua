local M = {}

local function open_netrw()
	vim.cmd("Sex %:h")
end

local function close_netrw()
	local i = vim.fn.bufnr("$")
	while i >= 1 do
		local ft = vim.fn.getbufvar(i, "&filetype")
		if ft == "netrw" then
			vim.cmd { cmd = "bw", args = { i } }
			break
		end
		i = i - 1
	end
end

function M.toggle_netrw()
	local is_open = _G.is_netrw_open or false
	if is_open then
		close_netrw()
	else
		open_netrw()
	end
	_G.is_netrw_open = not is_open
end

return M
