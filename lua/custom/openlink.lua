local M = {}

---@param str  string
---@param pos  integer
---@return string
local function find_url_at(str, pos)
	local l = pos
	while l > 0 and str:sub(l, l) ~= "(" and str:sub(l, l) ~= ' ' do
		l = l - 1
	end

	local r = pos
	while r < str:len() and str:sub(r, r) ~= ")" and str:sub(r, r) ~= " " do
		r = r + 1
	end

	if str:sub(l, l) == "(" or str:sub(l, l) == " " then
		l = l + 1
	end

	if str:sub(r, r) == ")" or str:sub(r, r) == " " then
		r = r - 1
	end

	return str:sub(l, r)
end


local function open_exact()
	local current_line = vim.api.nvim_get_current_line()
	local _, col = unpack(vim.api.nvim_win_get_cursor(0))

	local url = find_url_at(current_line, col)
	vim.cmd("!open " .. url)
end

M.open_exact = open_exact

---@param str  string
---@return string
local function find_url(str)
	local pattern = "%l*://[%^ >,;]*"
	local l = str:find(pattern)

	local r = l
	while r < str:len() and str:sub(r, r) ~= ")" and str:sub(r, r) ~= " " do
		r = r + 1
	end

	if str:sub(r, r) == ")" or str:sub(r, r) == " " then
		r = r - 1
	end

	return str:sub(l, r)
end


local function open_line()
	local current_line = vim.api.nvim_get_current_line()

	local url = find_url(current_line)
	vim.cmd("!open " .. url)
end

M.open_line = open_line

return M
