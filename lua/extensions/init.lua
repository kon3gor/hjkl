local E = {}

---@param name string
---@param settings table?
function E.load(name, settings)
	local ok, extension = pcall(require, "extensions." .. name)
	if ok then
		extension.setup(settings or {})
	end
end

return E
