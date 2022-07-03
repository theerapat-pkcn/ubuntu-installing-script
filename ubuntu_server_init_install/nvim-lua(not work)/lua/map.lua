-- use space as a the leader key
vim.g.mapleader = ' '

vim.cmd [[
    noremap l h
    noremap ; j
    noremap p k
    noremap ' l
    noremap k p
    noremap K P
    nnoremap <C-l> <C-w>h
    nnoremap <C-;> <C-w>j
    nnoremap <C-p> <C-w>k
    nnoremap <C-'> <C-w>l
    noremap <Leader>q :qa!<Enter>
    noremap <Leader>w :w<Enter>
    noremap <Leader>e :wq<Enter>
    noremap <C-t> :NERDTreeToggle<CR>
]]



---- Is able to also set key as function
-- keymap('n', 'Q', function()
--     print('Hello')
-- end, {desc = 'Say hello'})

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap
-- keymap({'n', 'v'}, 'l', 'h', opts)
-- keymap({'n', 'v'}, ';', 'j', opts)
-- keymap({'n', 'v'}, 'p', 'k', opts)
-- keymap({'n', 'v'}, "'", 'l', opts)
-- keymap('n', 'k', 'p', opts)
-- keymap('n', 'K', 'P', opts)
-- keymap('n', '<Leader>q', ':qa!<Enter>', opts)
-- keymap('n', '<Leader>w', ':w<Enter>', opts)
-- keymap('n', '<Leader>e', ':wq<Enter>', opts)
-- keymap('n', '<Leader><Leader>', ':HopWord<Enter>', opts)
-- keymap('n', '<C-t>', ':NERDTreeToggle<CR>', opts)
-- keymap('n', '<C-l>', '<C-w>h', opts)
-- keymap('n', '<C-;>', '<C-w>j', opts)
-- keymap('n', '<C-p>', '<C-w>k', opts)
-- keymap('n', "<C-'>", '<C-w>l', opts)