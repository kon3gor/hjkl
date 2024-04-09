require("plugins.packer")
require("global.options")
require("global.mapping")
require("api.commands")
require("folds")

vim.api.nvim_command("autocmd BufReadPost,FileReadPost * normal zR")

vim.filetype.add({
	extension = {
		astro = "astro"
	}
})
