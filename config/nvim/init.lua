local vim = vim
vim.g.mapleader = " "

vim.g.fzf_prefer_tmux = 0

require('packer').startup(function()
    use 'junegunn/vim-slash'
    use 'romainl/vim-cool'
    use 'jreybert/vimagit'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'sheerun/vim-polyglot'
    use 'terryma/vim-multiple-cursors'
    use 'raimondi/delimitmate'
    use { 'junegunn/fzf', run = 'cd ~/.fzf && ./install --all' }
    use 'junegunn/fzf.vim'
    use { 'elzr/vim-json', ft = { 'json' } }
    use { 'calebsmith/vim-lambdify', ft = { 'python' } }
    use 'icymind/NeoSolarized'
    use 'michaeljsmith/vim-indent-object'
    use 'eugen0329/vim-esearch'
    use 'idanarye/vim-merginal'
    use 'kien/rainbow_parentheses.vim'
    use 'Bling/vim-airline'
    use 'Glench/Vim-Jinja2-Syntax'
    use 'LucHermitte/lh-cmake'
    use { 'ternjs/tern_for_vim', ft = { 'javascript' } }
    use 'yuezk/vim-js'
    use 'MaxMEllon/vim-jsx-pretty'
    use 'airblade/vim-gitgutter'
    use 'benmills/vimux'
    use 'christoomey/vim-tmux-navigator'
    use 'clones/vim-l9'
    use 'easymotion/vim-easymotion'
    use 'edkolev/promptline.vim'
    use 'edkolev/tmuxline.vim'
    use 'godlygeek/tabular'
    use 'jistr/vim-nerdtree-tabs'
    use 'majutsushi/tagbar'
    use 'moll/vim-bbye'
    use 'Yggdroot/indentLine'
    use 'rust-lang/rust.vim'
    use 'scrooloose/nerdcommenter'
    use 'scrooloose/nerdtree'
    use 'szw/vim-tags'
    use 'terryma/vim-expand-region'
    use 'tmux-plugins/vim-tmux'
    use 'tmux-plugins/vim-tmux-focus-events'
    use 'tpope/vim-abolish'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'vim-airline/vim-airline-themes'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
end)

local required_lsps = {
    "clangd",
    "cmake",
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "sumneko_lua",
    "marksman",
    "pyright",
    "sqlls",
    "yamlls"
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = required_lsps
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
    debounce_text_changes = 150
}

vim.opt.completeopt = 'menu,menuone,noselect'


vim.g.indentLine_concealcursor = 'vc'
vim.opt.concealcursor = 'vc'
vim.g.indentLine_char = '┆'

vim.opt.termguicolors = true
vim.opt.background = 'light'

vim.g.solarized_underline = 0
vim.g.solarized_termcolors = 256
vim.cmd([[
    colorscheme NeoSolarized
]])

vim.g.indent_guides_guide_size = 1
vim.g.indent_guides_enable_on_vim_startup = 1

vim.cmd([[
" Expand
imap <expr> <C-x><C-x>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-x><C-x>  vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
]])

-- airline
vim.g.airline_theme = 'solarized'
vim.g.airline_powerline_fonts = 1
vim.g.tmuxline_theme= 'airline'
vim.g.tmuxline_preset = 'powerline'
vim.g.tmuxline_powerline_separators = 1
vim.g.promptline_powerline_symbols = 1
vim.g.cmdline_in_buffer = 0

vim.cmd([[
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
filetype plugin indent on
syntax on

let did_install_default_menus = 1
let did_install_syntax_menu = 1
let g:user_zen_leader_key = '<D-Space>'
]])

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
vim.opt.shellslash = true
vim.opt.grepprg = 'grep -nH $*'
vim.opt.spelllang = 'ru_yo,en'
vim.opt.spell = false
vim.opt.colorcolumn = '85'
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = 'number'


vim.cmd([[
hi CursorLine term=bold cterm=bold ctermbg=7
hi Search ctermbg=11 ctermfg=white
]])

local api = vim.api

-- Mappings
-- Window movements
api.nvim_set_keymap("n", "<M-TAB>", "<C-w><C-w>", { noremap = true })
api.nvim_set_keymap("n", "<M-S-TAB>", "<C-w><C-p>", { noremap = true })
api.nvim_set_keymap("n", "<C-tab>", ":bn<cr>", { noremap = true })
api.nvim_set_keymap("n", "<C-s-tab>", ":bp<cr>", { noremap = true })

-- Spell checking
api.nvim_set_keymap("n", "<leader>ss", ":setlocal spell!<cr>", { noremap = true })
api.nvim_set_keymap("", "<leader>sn", "]s", {})
api.nvim_set_keymap("", "<leader>sp", "[s", {})
api.nvim_set_keymap("", "<leader>sa", "zg", {})
api.nvim_set_keymap("", "<leader>s?", "z=", {})

api.nvim_set_keymap("", "<leader>v", ":vsp $MYVIMRC<CR>", {})
api.nvim_set_keymap("", "<leader>V", ":source $MYVIMRC<CR>", {})

api.nvim_set_keymap("n", "<leader>o", ":Files<CR>", { silent = true })
api.nvim_set_keymap("n", "<leader>t", ":Tags<CR>", { silent = true })
api.nvim_set_keymap("n", "<leader>b", ":Buffers<CR>", { silent = true })

-- nmap <leader>er :Error<CR>

api.nvim_set_keymap("n", "<leader>nt", ":NERDTreeToggle %:p:%h<CR>", {noremap = true, silent = true})
api.nvim_set_keymap("n", "<leader>tl", ":TagbarToggle<CR>", {noremap = true, silent = true})

-- Searching
api.nvim_set_keymap("n", "/", "/\\v", { noremap = true })
api.nvim_set_keymap("v", "/", "/\\v", { noremap = true })
api.nvim_set_keymap("n", "<leader>,", ":noh<CR>", { noremap = true })

local keys_to_disable = { "<up>", "<down>", "<left>", "<right>" }
for _, key in ipairs(keys_to_disable) do
    api.nvim_set_keymap("n", key, "<nop>", { noremap = true })
    api.nvim_set_keymap("i", key, "<nop>", { noremap = true })
end
api.nvim_set_keymap("i", "<c-l>", "<c-k>l*", { noremap = true })
api.nvim_set_keymap("n", "j", "gj", { noremap = true })
api.nvim_set_keymap("n", "k", "gk", { noremap = true })
api.nvim_set_keymap("n", ";", ":", { noremap = true })
api.nvim_set_keymap("n", "<leader>w", "<C-w>v<C-w>l", { noremap = true })

api.nvim_set_keymap("", "<S-Enter>", "O<Esc", {})
api.nvim_set_keymap("", "<c-Enter>", "o<Esc", {})

vim.cmd([[

" Python specific settings -----------------------------------------------------
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py,*.pyw :call DeleteTrailingWS()
" Use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
autocmd FileType python highlight BadWhitespace ctermbg=red guibg=red
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Latex settings --------------------------------------------------------------
let g:tex_flavor='latex'
au FileType latex :set sw=2
au FileType latex :set iskeyword+=:

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END


au BufRead,BufNewFile *.thrift set filetype=thrift

" Vimux

nnoremap <leader>rp :VimuxPromptCommand<CR>
nnoremap <leader>rl :VimuxRunLastCommand<CR>

" EasyMotion
" <Leader>f{char} to move to {char}
map  <Leader><Space> <Plug>(easymotion-bd-f)
nmap <Leader><Space> <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


" te,st
let test#strategy = "vimux"
nnoremap <Leader>tt :TestFile<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

let g:vim_tags_project_tags_command = "{CTAGS} {OPTIONS} `git ls-files` 2>/dev/null"
let g:fzf_tags_command =  'ctags `git ls-files`'
if executable('pt')
    set grepprg=pt\ --nogroup\ --nocolor
    let g:fzf_files_command = 'pt -g ""'
endif

nnoremap <Leader>q :Bdelete<CR>
"
let g:esearch = {
  \ 'adapter':    'pt',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}
inoremap jj <Esc>

" Use | and _ to split windows (while preserving original behaviour of [count]bar and [count]_).
nnoremap <expr><silent> <Bar> v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"
nnoremap <expr><silent> _     v:count == 0 ? "<C-W>s<C-W><Down>"  : ":<C-U>normal! ".v:count."_<CR>"

autocmd BufWritePre * :%s/\s\+$//e

autocmd! FocusLost * redraw
au CompleteDone * pclose!
nnoremap <leader>c :!cargo clippy
]])

local cmp = require'cmp'

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
    }, {
    { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
    { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(required_lsps) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities
    }
end

