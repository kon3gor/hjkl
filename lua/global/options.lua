-- Globals
vim.g.mapleader = " "
vim.g.loaded_netrwPlugin = 0

-- Options
local opts = vim.opt

opts.relativenumber = true
opts.number = true
opts.wildmenu = true
opts.shiftwidth = 4
opts.tabstop = 4
opts.clipboard = "unnamedplus"
opts.wrap = false
opts.swapfile = false

-- This is for normal human beings but it folds all content
-- opts.foldmethod = "expr"
-- opts.foldexpr = "nvim_treesitter#foldexpr()"
