-- Key mappings
local map = vim.keymap.set

-- Remap ; to : in normal mode
map('n', ';', ':', { noremap = true })

-- Quick save
map('n', '<leader>w', ':w<CR>', { noremap = true })

-- Better window navigation
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })
