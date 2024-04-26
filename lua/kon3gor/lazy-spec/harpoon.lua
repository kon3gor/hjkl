local spec = {
	'ThePrimeagen/harpoon',
}

local function configure()
	local remap = require("kon3gor.tools.remap")

	local silent = { silent = true }
	remap.nnoremap('<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', silent)
	remap.nnoremap('<leader>a', ':lua require("harpoon.mark").add_file()<CR>', silent)
	remap.nnoremap('<leader>n', ':lua require("harpoon.ui").nav_next()<CR>', silent)
	remap.nnoremap('<leader>b', ':lua require("harpoon.ui").nav_prev()<CR>', silent)
end

spec.config = configure

return spec
