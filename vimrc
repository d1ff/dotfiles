let g:fzf_prefer_tmux = 0
lua <<EOF

return require('packer').startup(function()
use 'junegunn/vim-slash'
use 'romainl/vim-cool'
use 'jreybert/vimagit'
use {'neoclide/coc.nvim', branch = 'release'}
use 'sheerun/vim-polyglot'
use 'sven-strothoff/vim-clang_doxygen'
use { 'mrtazz/DoxygenToolkit.vim', ft = { 'cpp' } }
use { 'arakashic/chromatica.nvim', ft = { 'cpp' } }
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
end)

EOF

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-rls', 'coc-pyright', 'coc-snippets', 'coc-cmake', 'coc-clangd']

let g:indentLine_concealcursor = 'vc' "(default 'inc')
set concealcursor=vc
let g:indentLine_char='┆'

set termguicolors
set background=light
let g:solarized_underline=0
let g:solarized_termcolors=256
colorscheme NeoSolarized

" indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" snippets
" Use <C-x><C-x> for trigger snippet expand.
imap <C-x><C-x> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:tmuxline_theme='airline'
let g:tmuxline_preset = 'powerline'
let g:tmuxline_powerline_separators = 1
let g:promptline_powerline_symbols = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:cmdline_in_buffer = 0

filetype plugin indent on
syntax on

let did_install_default_menus = 1
let did_install_syntax_menu = 1
let g:user_zen_leader_key = '<D-Space>'

"set lines=999
"set columns=999

"" Settings --------------------------------------------------------------------
set nocompatible
set modelines=1
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set number ruler
set autoindent smartindent
set showmode showcmd
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set wildmenu wildmode=list:longest
set visualbell
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=7
hi Search ctermbg=11 ctermfg=white
set ttyfast
set lazyredraw
set clipboard=unnamed
set ruler
set backspace=indent,eol,start
set scrolloff=3
set ignorecase smartcase
set gdefault
set incsearch showmatch hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,cp866,koi8-r,ucs-2
set shellslash
set grepprg=grep\ -nH\ $*
set spelllang=ru_yo,en
set nospell
set colorcolumn=85

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Mappings --------------------------------------------------------------------
let mapleader = "\<Space>"
" Cycle through windows
nnoremap <M-TAB> <C-w><C-w>
nnoremap <M-S-TAB> <C-w><C-p>
nnoremap <C-tab> :bn<cr>
nnoremap <c-s-tab> :bp<cr>
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

""Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
"nmap <leader>f :set fu!<CR>
map <leader>v :vsp $MYVIMRC<CR>
map <leader>V :source $MYVIMRC<CR>

nmap <leader>cd :FufDir<CR>
nmap <leader>of :FufFile<CR>
"nmap <leader>bu :CtrlSpace<CR>
nmap <leader>er :Error<CR>
nnoremap <silent> <leader>nt :NERDTreeToggle %:p:h<CR>
nnoremap <silent> <leader>tl :TagbarToggle<CR>

""Searching yamies
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>, :noh<cr>
"" Navigate mappings
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <c-l> <c-k>l*
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap <leader>w <C-w>v<C-w>l
map <S-Enter> O<Esc>
map <c-Enter> o<Esc>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Foldings --------------------------------------------------------------------
function! ToggleFoldColumn()
    if &foldenable == 1
        set foldcolumn=1
    else
        set foldcolumn=0
    endif
endfunction
"set nofoldenable
nnoremap <silent> <leader>fe :set foldenable!<cr>:call ToggleFoldColumn()<cr>
nnoremap <leader>e za

vnoremap <leader>e zf

set nofoldenable

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

nnoremap <Leader>o :Files<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>b :Buffers<CR>

" test
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
