require("plugins.packer")
require("global.options")
require("global.mapping")
require("api.commands")

vim.cmd[[autocmd VimEnter * COQnow -s]]
vim.cmd[[autocmd VimEnter * TSContextEnable]]

