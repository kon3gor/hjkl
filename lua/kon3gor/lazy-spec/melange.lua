local function configure()
	vim.opt.termguicolors = true
	vim.cmd("colorscheme melange")
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end

local spec = {
	"savq/melange",
	lazy = false,
	priority = 69420,
	config = configure,
}


return spec
