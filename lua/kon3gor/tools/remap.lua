local utils = require("kon3gor.tools.tables")

local M = {}

local options = { noremap = true }

function M.nnoremap(from, to, opts)
	opts = utils.merge(options, opts)
	vim.keymap.set('n', from, to, opts)
end

function M.inoremap(from, to, opts)
	opts = utils.merge(options, opts)
	vim.keymap.set('i', from, to, opts)
end

function M.xnoremap(from, to, opts)
	opts = utils.merge(options, opts)
	vim.keymap.set('x', from, to, opts)
end

function M.tnoremap(from, to, opts)
	opts = utils.merge(options, opts)
	vim.keymap.set('t', from, to, opts)
end

return M
