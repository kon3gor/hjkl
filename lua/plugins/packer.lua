return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}

	use {
		'gelguy/wilder.nvim',
		config = function() modues = { ':', '/', '?' } end,
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}

	use 'nvim-treesitter/nvim-treesitter-context'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	--LSP
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"

	--cmp
	use { "ms-jpq/coq_nvim", branch = "coq" }
	use { "ms-jpq/coq.artifacts", branch = "artifacts" }
	use { "ms-jpq/coq.thirdparty", branch = "3p" }

	--color scehmes
	use "savq/melange"

	--stuff
	use "ThePrimeagen/vim-be-good"
	use "dart-lang/dart-vim-plugin"
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
end)
