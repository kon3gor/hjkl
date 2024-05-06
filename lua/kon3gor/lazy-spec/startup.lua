local pockemons = require("pockemons")

local settings = {
	-- every line should be same width without escaped \
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		content = pockemons.gengar_60,
		highlight = "Statement",
		default_color = "",
		oldfiles_amount = 0,
	},
	-- name which will be displayed and command
	body = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 5,
		content = {
			{ " Find File", "Telescope find_files", "f" },
			{ " Find Word", "Telescope live_grep", "g" },
			{ " New File", "lua require'startup'.new_file()", "n" },
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},
	footer = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Footer",
		margin = 5,
		content = { "Fork me daddy" },
		highlight = "Number",
		default_color = "",
		oldfiles_amount = 0,
	},

	options = {
		mapping_keys = true,
		cursor_column = 0.5,
		empty_lines_between_mappings = true,
		disable_statuslines = true,
		paddings = { 1, 3, 3, 0 },
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#1f2227",
		folded_section = "#56b6c2",
	},
	parts = { "header", "body", "footer" },
}
local function configure()
	local startup = require("startup")
	startup.setup(settings)
end

local spec = {
	'startup-nvim/startup.nvim',
	config = configure
}

return spec
