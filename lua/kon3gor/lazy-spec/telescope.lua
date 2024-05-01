local extensions = {
	"fzf",
}

local config = {
	extensions = {
		fzf = {
			fuzzy = true,          -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		project = {
			base_dirs = {
				{ '~/Documents/development', max_depth = 1 },
				{ '~/.config/nvim',          max_depth = 1 },
			},
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true,
			project = {
				display_type = "full"
			}
		}
	},
	defaults = {
		file_ignore_patterns = { "node_modules", "build", "^.git", "env" },
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--hidden'
		}
	}

}

local function configure()
	local telescope = require('telescope')
	telescope.setup(config)

	local remap = require("kon3gor.tools.remap")
	local silent = { silent = true }
	remap.nnoremap('<C-f>', ':Telescope find_files<CR><ESC>')
	remap.nnoremap('<C-g>', ':Telescope live_grep<CR><ESC>', silent)
	remap.nnoremap('<C-p>', ':Telescope projects<CR><ESC>', silent)
	remap.nnoremap('<C-b>', ':Telescope buffers<CR><ESC>', silent)

	for i = 1, #extensions do
		telescope.load_extension(extensions[i])
	end
end

local spec = {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		}
	},
	config = configure(),
}

return spec
