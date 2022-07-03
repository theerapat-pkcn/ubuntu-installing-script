vim.cmd [[
  syntax enable
  syntax on

  set noerrorbells
  set nowrap
  set noshowmode
  set listchars=tab:»·,space:.,eol:¬
  set list
  set nu
  set relativenumber
  set undodir=~/.vim/undodir
  set undofile
  set nosmartindent
  set expandtab
  set mouse=a
]]

-- Set by lua
local set = vim.opt
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2