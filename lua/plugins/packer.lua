return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}

	use 'gelguy/wilder.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}

	use 'nvim-treesitter/nvim-treesitter-context'

	--- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use "ahmedkhalf/project.nvim"

	-- LSP
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"
	use "dart-lang/dart-vim-plugin"

	-- Completion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"

	-- Snippets
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"

	-- color scehmes
	use {
		"savq/melange",
	}

	--stuff
	use "ThePrimeagen/vim-be-good"
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	--[[ use {
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		config = function() require("dash") end,
		requires = { 'nvim-tree/nvim-web-devicons' }
	}]] --

	use {
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup ( require("mystartup") )
		end
	}
	use({ "MaximilianLloyd/ascii.nvim", requires = {
		"MunifTanjim/nui.nvim"
	} })
end)
