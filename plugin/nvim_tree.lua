vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
	create_in_closed_folder = false,
	respect_buf_cwd = false,
	auto_reload_on_write = true,
	disable_netrw = false,
	hijack_cursor = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = false,
	sort_by = "name",
	sync_root_with_cwd = true,
	view = {
		mappings = {
			list = {
				-- remove a default mapping for cd
				{ key = "+", action = "cd" },

			}
		},
		adaptive_size = true,
		centralize_selection = false,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		hide_root_folder = false,
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
