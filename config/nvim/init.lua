local vim = vim

vim.g.mapleader = " "

require('plugins')
require('options')
require('mappings')

vim.cmd([[
colorscheme NeoSolarized
filetype plugin indent on
syntax on
hi CursorLine term=bold cterm=bold ctermbg=7
hi Search ctermbg=11 ctermfg=white
]])
