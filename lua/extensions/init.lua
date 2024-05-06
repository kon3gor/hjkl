local E = {}

function E.load(module)
	pcall(require, "extensions." .. module)
end

return E
