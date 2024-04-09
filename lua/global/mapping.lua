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

local function tnoremap(from, to)
	vim.api.nvim_set_keymap('t', from, to, options)
end

-- Ctrl Remaps
nnoremap('<C-f>', ':Telescope find_files<CR><ESC>')
nnoremap('<C-g>', ':Telescope live_grep<CR><ESC>', { silent = true })
nnoremap('<C-p>', ':Telescope projects<CR><ESC>', { silent = true })
nnoremap('<C-b>', ':Telescope buffers<CR><ESC>', { silent = true })
nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-l>', '<C-w>l')

-- Leader remaps
-- nnoremap('<leader>o', 'o<ESC>0')
-- nnoremap('<leader>O', 'O<ESC>0')
xnoremap('<leader>p', '\"_dP')
nnoremap('<leader>t', ':NvimTreeToggle<CR>', { silent = true })
nnoremap('<leader>l', ':NvimTreeFindFile<CR>', { silent = true })
nnoremap('<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { silent = true })
nnoremap('<leader>a', ':lua require("harpoon.mark").add_file()<CR>', { silent = true })
nnoremap('<leader>n', ':lua require("harpoon.ui").nav_next()<CR>', { silent = true })
nnoremap('<leader>b', ':lua require("harpoon.ui").nav_prev()<CR>', { silent = true })
nnoremap('<leader>oo', ':lua require("custom.openlink").open_exact()<CR><ESC>', { silent = true })
nnoremap('<leader>ol', ':lua require("custom.openlink").open_line()<CR><ESC>', { silent = true })

-- Idk which remaps
inoremap('jk', '<ESC>')
nnoremap('ch', ':nohl<CR>', { silent = true })
nnoremap('$', 'g_')
