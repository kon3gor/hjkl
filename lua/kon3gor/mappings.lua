local remap = require("kon3gor.tools.remap")
local silent = { silent = true }

-- Ctrl Remaps
remap.nnoremap('<C-d>', '<C-d>zz')
remap.nnoremap('<C-u>', '<C-u>zz')
remap.nnoremap('<C-j>', '<C-w>j')
remap.nnoremap('<C-k>', '<C-w>k')
remap.nnoremap('<C-h>', '<C-w>h')
remap.nnoremap('<C-l>', '<C-w>l')

-- Leader remaps
remap.nnoremap('<leader>o', 'o<ESC>0')
remap.nnoremap('<leader>O', 'O<ESC>0')
remap.xnoremap('<leader>p', '\"_dP')
--remap.nnoremap('<leader>t', ':Sex %:p:h<CR>', silent)
remap.nnoremap('<leader>t', function() require("kon3gor.netrw").toggle_netrw() end, silent)
remap.nnoremap('<leader>oo', ':lua require("custom.openlink").open_exact()<CR><ESC>', silent)
remap.nnoremap('<leader>ol', ':lua require("custom.openlink").open_line()<CR><ESC>', silent)
remap.nnoremap('<leader>cn', ':cn<CR>', silent)
remap.nnoremap('<leader>cp', ':cp<CR>', silent)
remap.nnoremap('<leader>nf', ':e %:h/', silent)

-- Idk which remaps
remap.inoremap('jk', '<ESC>')
remap.nnoremap('ch', ':nohl<CR>', silent)
remap.nnoremap('$', 'g_')

remap.nnoremap('<space>e', vim.diagnostic.open_float, silent)
remap.nnoremap('[d', vim.diagnostic.goto_prev, silent)
remap.nnoremap(']d', vim.diagnostic.goto_next, silent)
remap.nnoremap('<space>q', vim.diagnostic.setloclist, silent)
remap.nnoremap('<leader>cj', '<C-w>j:q<CR>', silent)
