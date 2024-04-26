local config = {
		highlight = {
			enable = true,
		},
		indent = {
			indent = true
		}
	}

local function configure()
	local configs = require("nvim-treesitter.configs")
	configs.setup(config)

	local context = require("treesitter-context")
	context.setup()
end

local spec = {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-context'
	},
	build = function()
		require('nvim-treesitter.install').update({ with_sync = true })
	end,
	config = configure,
}

return spec
