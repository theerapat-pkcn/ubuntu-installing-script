vim.cmd [[
  syntax enable
  syntax on
]]

local set = vim.opt
set.noerrorbells = true
set.nowrap = true
set.noshowmode = true
set.listchars = tab:»·,space:.,eol:¬
set.list = true
set.nu = true
set.relativenumber = true
set.undodir = ~/.vim/undodir
set.undofile = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.nosmartindent = true
set.expandtab = true
set.mouse = a
set.colorcolumn = 80
set.t_Co = 256
set.splitbelow = true
set.splitright = true