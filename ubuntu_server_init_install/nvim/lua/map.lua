-- use space as a the leader key
vim.g.mapleader = ' '

vim.keymap.set('n', 'l', 'h')
vim.keymap.set('n', ';', 'j')
vim.keymap.set('n', 'p', 'k')
vim.keymap.set('n', "'", 'l')
vim.keymap.set('n', 'k', 'p')
vim.keymap.set('n', 'K', 'P')
vim.keymap.set('n', '<C-l>', '<C-w>h')
vim.keymap.set('n', '<C-;>', '<C-w>j')
vim.keymap.set('n', '<C-p>', '<C-w>k')
vim.keymap.set('n', "<C-'>", '<C-w>l')
vim.keymap.set('n', '<Leader>q', ':qa!<Enter>')
vim.keymap.set('n', '<Leader>w', ':w<Enter>')
vim.keymap.set('n', '<Leader>e', ':wq<Enter>')
vim.keymap.set('n', '<Leader><Leader>', ':HopWord<Enter>')
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')

---- Is able to also set key as function
-- vim.keymap.set('n', 'Q', function()
--     print('Hello')
-- end, {desc = 'Say hello'})