-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
	sync_root_with_cwd = true,
	view = {
		adaptive_size = true,
		centralize_selection = false,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		float = {
			enable = false,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		group_empty = true
	},
	filters = {
		dotfiles = false,
		custom = { ".DS_Store" },
		exclude = {},
	},
})

local api = require("nvim-tree.api")
local options = { noremap = true, silent = true }

local function findFile()
	local buffer = vim.api.nvim_buf_get_name(0)
	api.tree.change_root_to_parent(buffer)
end

vim.keymap.set('n', '<C-s>', findFile, options)
