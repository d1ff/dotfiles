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
hi link TelescopePromptBorder SignColumn
hi link TelescopePromptNormal SignColumn
hi link TelescopePromptPrefix SignColumn
hi link TelescopeSelection CursorLine
hi link TelescopePreviewTitle lualine_a_visual
hi link TelescopePromptTitle lualine_a_insert
hi link TelescopeResultsTitle lualine_a_normal
]]
