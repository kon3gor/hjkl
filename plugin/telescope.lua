require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		project = {
			base_dirs = {
				{ '~/Documents/development', max_depth = 1 },
				{ '~/.config/nvim', max_depth = 1 },
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


require("project_nvim").setup {
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml", "gradlew", "go.mod" },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
