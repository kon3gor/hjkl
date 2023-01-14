require("plugins.packer")
require("global.options")
require("global.mapping")
require("nvim-tree").setup()

vim.cmd[[autocmd VimEnter * COQnow -s]]
vim.cmd[[autocmd VimEnter * TSContextEnable]]
