call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'benmills/vimux'
Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'slurps-mad-rips/cmake.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'Valloric/YouCompleteMe'
Plug 'mattn/emmet-vim'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'd1ff/vim-cmake-project'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'peterhoeg/vim-qml'
Plug 'szw/vim-tags'
Plug 'jalvesaq/vimcmdline'
Plug 'benmills/vimux'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/TagHighlight'
Plug 'clones/vim-fuzzyfinder'
Plug 'clones/vim-l9'
Plug 'LucHermitte/lh-cmake'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-]>"
let g:UltiSnipsJumpBackwardTrigger="<C-[>"

call plug#end()

"let g:airline_powerline_fonts = 0 
let g:tmuxline_powerline_separators = 0
let g:promptline_powerline_symbols = 0
let g:ycm_confirm_extra_conf = 0
let g:airline#extensions#tabline#enabled = 1
let g:cmdline_in_buffer = 0
if has('python')
    let g:jedi#force_py_version = 2
    let g:syntastic_python_python_exec = 'python2'
    let g:pymode_python = 'python2'
    let g:syntastic_python_python_exec = 'python2'

    "python from powerline.vim import setup as powerline_setup
    "python powerline_setup()
    "python del powerline_setup
elseif has('python3')
    let g:jedi#force_py_version = 3
    let g:syntastic_python_python_exec = 'python3'
    let g:pymode_python = 'python3'
    let g:syntastic_python_python_exec = 'python3'

    "python3 from powerline.vim import setup as powerline_setup
    "python3 powerline_setup()
    "python3 del powerline_setup
else
    let g:loaded_jedi = 1
endif

let g:pymode_lint=0
let g:pymode_lint_checker='pyflakes'
let g:pymode_rope=0

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

filetype plugin indent on
syntax on


let g:colorsamplerpack_loaded = 1
let did_install_default_menus = 1
let did_install_syntax_menu = 1
let g:user_zen_leader_key = '<D-Space>'
let g:clang_hl_errors = 0
let g:clang_use_library = 1
let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:clang_compilation_database = '/Users/d1ff/Programming/fmtapper/build/'

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
set wildmenu wildmode=list:longest
set visualbell
set cursorline
set ttyfast
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
if v:version >= 703
    set colorcolumn=85

    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set undofile swapfile backup
endif


" Mappings --------------------------------------------------------------------
let mapleader = "," 
" Cycle through windows
nnoremap <M-TAB> <C-w><C-w>
nnoremap <M-S-TAB> <C-w><C-p>
nnoremap <C-tab> :bn<cr>
nnoremap <c-s-tab> :bp<cr>
" Smart way to move btw. windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

""Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
nmap <leader>f :set fu!<CR>
map <leader>v :vsp $MYVIMRC<CR>
map <leader>V :source $MYVIMRC<CR>
"map <leader>pt :Pytest file<CR>

" Eclim maps
"nmap <leader>po :ProjectOpen 
"nmap <leader>pt :ProjectsTree<CR>
"nmap <leader>pcd :ProjectCD<CR>
"nmap <leader>plcd :ProjectLCD<CR>

" NerdTree Toogle
nmap <leader>po :NERDTreeToggle<CR>

nmap <leader>ac :Ack
nmap <leader>cd :FufDir<CR>
nmap <leader>of :FufFile<CR>
nmap <leader>bu :CtrlSpace<CR>
nmap <leader>er :Error<CR>
nmap <leader>td :TaskList<CR>
nmap <leader>gu :GundoToggle<CR>
nnoremap <silent> <leader>nt :NERDTreeToggle %:p:h<CR>
nnoremap <silent> <leader>tl :TagbarToggle<CR>
nmap <silent> <Leader>pr <Plug>ToggleProject
""Searching yamies
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
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

" c++
autocmd FileType cpp set equalprg=astyle


" Autocomplete settings -------------------------------------------------------
let g:SuperTabDefaultCompletionType = "context"

" View opts -------------------------------------------------------------------
if has("gui_running")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12
    "set noantialias " Terminus looks better that way
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set fuopt+=maxhorz
    colorscheme Tomorrow-Night
else
  set t_Co=256
  let g:indent_guides_indent_levels = 0
  set background=dark
  let base16colorspace=256
  colorscheme base16-default
endif

" Tag list settings -----------------------------------------------------------
let Tlist_Use_Right_Window=1
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=1
set updatetime=1000
let g:Tlist_Show_One_File = 1 
let g:Tlist_GainFocus_On_ToggleOpen = 1

" HTML close tag plugin -------------------------------------------------------
let g:closetag_html_style=1
" au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 

" Pascal specific settings ----------------------------------------------------
au FileType pascal set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Latex settings --------------------------------------------------------------
let g:tex_flavor='latex'
au FileType latex :set sw=2
au FileType latex :set iskeyword+=:

" Syntastic settings ----------------------------------------------------------
let g:syntastic_enable_signs=1

" Vimwiki settings ------------------------------------------------------------
let wiki = {}
let wiki.path = '~/wiki/'
let wiki.path_html = '~/Sites/wiki/'
let wiki.nested_syntaxes = {'python': 'python'}
let wiki.auto_export = 1
let wiki.html_header = '~/wiki/header.tpl'
let g:vimwiki_list = [wiki]

" Foldings --------------------------------------------------------------------
function! ToggleFoldColumn()
    if &foldenable == 1
        set foldcolumn=1
    else
        set foldcolumn=0
    endif
endfunction
set nofoldenable
nnoremap <silent> <leader>fe :set foldenable!<cr>:call ToggleFoldColumn()<cr>

" Less
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.ino set filetype=c

let g:indent_guides_enable_on_vim_startup = 1
let g:pyflakes_use_quickfix = 1
let g:pep8_map='<leader>8'

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

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


let g:syntastic_cpp_config_file = '.clang_complete'

au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim"

"let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
"set noshowmatch         " Don't match parentheses/brackets
"set nocursorline        " Don't paint cursor line
"set nocursorcolumn      " Don't paint cursor column
"set lazyredraw          " Wait to redraw
"set scrolljump=8        " Scroll 8 lines at a time at bottom/top
"let html_no_rendering=1 " Don't render italic, bold, links in HTML"
"set noruler

"" tagbar
autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)

autocmd! BufWritePost * Neomake
