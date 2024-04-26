local M = {}

function M.merge(t1, t2)
	local res = t1 or {}
	for k, v in pairs(t2 or {}) do
		res[k] = v
	end
	return res
end

return M
