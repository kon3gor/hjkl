require("nvim-tree").setup({
	view = {
		mappings = {
			list = {
				-- remove a default mapping for cd
				{ key = "+", action = "cd" },

			}
		}
	},
	renderer = {
		group_empty = true
	}
})
local api = require("nvim-tree.api")
local options = { noremap = true, silent = true }

local function findFile()
	local buffer = vim.api.nvim_buf_get_name(0)
	api.tree.change_root_to_parent(buffer)
end

vim.keymap.set('n', '<C-s>', findFile, options)
