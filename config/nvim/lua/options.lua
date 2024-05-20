local vim = vim

vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.termguicolors = true
vim.opt.background = 'light'
-- Settings
vim.opt.compatible = false
vim.opt.modelines = 1
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'
vim.opt.visualbell = true
vim.opt.cursorline = true
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.clipboard = 'unnamed'
vim.opt.ruler = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.scrolloff = 3
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.textwidth = 79
vim.opt.formatoptions = 'qrn1'
vim.opt.ffs = 'unix,dos,mac'
vim.opt.fencs = 'utf-8,cp1251,cp866,koi8-r,ucs-2'
-- vim.opt.shellslash = true
vim.opt.grepprg = 'grep -nH $*'
vim.opt.spelllang = 'ru_yo,en'
vim.opt.spell = false
vim.opt.colorcolumn = '85'
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = 'number'

vim.g.tmuxline_theme = 'airline'
vim.g.tmuxline_preset = 'powerline'
vim.g.tmuxline_powerline_separators = 1
vim.g.promptline_powerline_symbols = 1
vim.g.cmdline_in_buffer = 0

vim.g.solarized_underline = 0
vim.g.solarized_termcolors = 256
