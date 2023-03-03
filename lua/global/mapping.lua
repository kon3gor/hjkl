local options = { noremap = true }

local function nnoremap(from, to, opts)
	opts = opts or {}
	for k, v in pairs(options) do opts[k] = v end
	vim.api.nvim_set_keymap('n', from, to, opts)
end

local function inoremap(from, to)
	vim.api.nvim_set_keymap('i', from, to, options)
end

local function xnoremap(from, to)
	vim.api.nvim_set_keymap('x', from, to, options)
end

-- Ctrl Remaps
nnoremap('<C-p>', ':Telescope find_files<CR><ESC>')
nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')

-- Leader remaps
nnoremap('<leader>o', 'o<ESC>0')
nnoremap('<leader>O', 'O<ESC>0')
xnoremap('<leader>p', '\"_dP')
nnoremap('<leader>t', ':NvimTreeToggle<CR>', { silent = true })
nnoremap('<leader>l', ':NvimTreeFindFile<CR>', { silent = true })
nnoremap('<leader>g', ':Telescope live_grep<CR><ESC>', { silent = true })

-- Idk which remaps
inoremap('jk', '<ESC>')
nnoremap('ch', ':nohl<CR>', { silent = true })
nnoremap('$', 'g_')
