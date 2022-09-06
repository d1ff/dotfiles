local vim = vim

vim.g.mapleader = " "

require('plugins')
require('impatient')
require('options')
require('mappings')


vim.cmd [[
colorscheme NeoSolarized
filetype plugin indent on
syntax on
hi CursorLine term=bold cterm=bold ctermbg=7
hi Search ctermbg=11 ctermfg=white
hi link TelescopeNormal CursorColumn
hi link TelescopeBorder CursorColumn
hi TelescopePromptBorder guifg=#80a0ff guibg=#e6dfcf
hi link TelescopePromptNormal TelescopePromptBorder
hi link TelescopePromptPrefix TelescopePromptPrefix
hi link TelescopeSelection CursorLine
hi link TelescopePreviewTitle lualine_a_visual
hi link TelescopePromptTitle lualine_a_insert
hi link TelescopeResultsTitle lualine_a_normal
]]
