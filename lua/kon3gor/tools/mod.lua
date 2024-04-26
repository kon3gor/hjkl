local M = {}

function M.require(prefix, modules)
	for i = 1, #modules do
		require(prefix .. "." .. modules[i])
	end
end

return M
