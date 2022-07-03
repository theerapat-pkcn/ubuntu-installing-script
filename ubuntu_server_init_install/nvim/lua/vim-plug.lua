-- Install plugin by `:PlugInstall` command
-- Uninstall plugin by remove plugin inside call plug and run `:PlugClean`
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdtree'
    Plug 'phaazon/hop.nvim'
vim.call('plug#end')

vim.cmd [[
    " Start NERDTree and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p
    "" Exit Vim if NERDTree is the only window remaining in the only tab.
    "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 
    "        \ && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    let NERDTreeShowHidden=1
]]

require'hop'.setup()