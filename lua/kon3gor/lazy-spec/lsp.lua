local remap = require("kon3gor.tools.remap")
local extensions = require("extensions")

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')


	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	remap.nnoremap('gD', vim.lsp.buf.declaration, bufopts)
	remap.nnoremap('gd', vim.lsp.buf.definition, bufopts)
	remap.nnoremap('K', vim.lsp.buf.hover, bufopts)
	remap.nnoremap('gi', vim.lsp.buf.implementation, bufopts)
	remap.nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts)
	remap.nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	remap.nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	remap.nnoremap('<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	remap.nnoremap('<space>D', vim.lsp.buf.type_definition, bufopts)
	remap.nnoremap('<space>rn', vim.lsp.buf.rename, bufopts)
	remap.nnoremap('<space>ca', vim.lsp.buf.code_action, bufopts)
	remap.nnoremap('gr', vim.lsp.buf.references, bufopts)
	remap.nnoremap('<space>f', function()
		vim.lsp.buf.format { async = true }
	end, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local function configure()
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	local opts = { noremap = true, silent = true }
	remap.nnoremap('<space>of', vim.diagnostic.open_float, opts)
	remap.nnoremap('[d', vim.diagnostic.goto_prev, opts)
	remap.nnoremap(']d', vim.diagnostic.goto_next, opts)
	remap.nnoremap('<space>q', vim.diagnostic.setloclist, opts)

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"gopls",
		},
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach,
					flags = lsp_flags,
					capabilities = capabilities,
				})
			end,
		}
	})

	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
		}, {
			{ name = 'buffer' },
		}),
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<ESC>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.,
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-p>'] = cmp.mapping.select_prev_item(),
		}),
		formatting = {
			fields = { "menu", "abbr", "kind" },
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format('(%s) ', vim_item.kind) -- This concatonates the icons with the name of the item kind
				-- Source
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[Lua]",
				})[entry.source.name]

				return vim_item
			end
		},
	})

	extensions.load("lsp", {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = lsp_flags,
	})
end

local spec = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = configure,
}

return spec
