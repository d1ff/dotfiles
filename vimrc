let g:fzf_prefer_tmux = 0
let g:brew_path = expand('/usr/local')
if !filereadable(g:brew_path . '/bin/brew')
    let g:brew_path = expand('~/.linuxbrew')
if !filereadable(g:brew_path . '/bin/brew')
    let g:brew_path = expand('/usr')
endif
endif
let g:python2_host_prog=g:brew_path.'/bin/python'
let g:python3_host_prog=g:brew_path.'/bin/python3'
"let g:tagbar_ctags_bin=g:brew_path.'/bin/ctags'
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-slash'
Plug 'romainl/vim-cool'
Plug 'jreybert/vimagit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'sven-strothoff/vim-clang_doxygen'
Plug 'mrtazz/DoxygenToolkit.vim', { 'for': 'cpp' }
Plug 'arakashic/chromatica.nvim', { 'for': 'cpp' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tweekmonster/django-plus.vim'
Plug 'raimondi/delimitmate'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'calebsmith/vim-lambdify', { 'for': ['python']}
Plug 'icymind/NeoSolarized'
Plug 'michaeljsmith/vim-indent-object'
Plug 'eugen0329/vim-esearch'
Plug 'idanarye/vim-merginal'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Bling/vim-airline'
Plug 'Chiel92/vim-autoformat'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'LucHermitte/lh-cmake'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'clones/vim-l9'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'godlygeek/tabular'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'moll/vim-bbye'
Plug 'Yggdroot/indentLine'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'szw/vim-tags'
Plug 'terryma/vim-expand-region'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-rls', 'coc-pyright']

"set relativenumber

let g:indentLine_concealcursor = 'vc' "(default 'inc')
set concealcursor=vc
let g:indentLine_char='┆'

"let base16colorspace=256
"set t_Co=256
"set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
"set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
set termguicolors
set background=light
"colorscheme default
let g:solarized_underline=0
let g:solarized_termcolors=256
colorscheme NeoSolarized

" vim-autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" github issues
if filereadable("~/.vim_github_issues")
    source ~/.vim_github_issues
    let g:gissues_async_omni = 1
    let g:gissues_lazy_load = 1
endif

" neomake
" let g:neomake_open_list = 2
let g:neomake_error_sign = {
    \ 'text': 'E>',
    \ 'texthl': 'Error',
\ }
let g:neomake_warning_sign = {
    \ 'text': 'W>',
    \ 'texthl': 'WarningMsg',
\ }
let g:neomake_cpp_clang_maker = {
            \ 'args': ['-fsyntax-only', '-std=c++14', '-Wall', '-Wextra'],
            \ 'errorformat':
            \ '%-G%f:%s:,' .
            \ '%f:%l:%c: %trror: %m,' .
            \ '%f:%l:%c: %tarning: %m,' .
            \ '%f:%l:%c: %m,'.
            \ '%f:%l: %trror: %m,'.
            \ '%f:%l: %tarning: %m,'.
            \ '%f:%l: %m',
            \ }
let g:neomake_cpp_clangtidy_maker = {
            \ 'exe': g:brew_path.'/opt/llvm/bin/clang-tidy',
            \ 'args': ['--checks="modernize-*,readability-*,misc-*,clang-analyzer-*"'],
            \ 'errorformat':
            \ '%E%f:%l:%c: fatal error: %m,' .
            \ '%E%f:%l:%c: error: %m,' .
            \ '%W%f:%l:%c: warning: %m,' .
            \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
            \ '%E%m',
            \ }
let g:neomake_cpp_enabled_makers = ['clang', 'clangtidy']
let g:neomake_python_python_exe = 'python3'

" snippets
let g:UltiSnipsExpandTrigger="<C-x><C-x>"
let g:UltiSnipsJumpForwardTrigger="<C-]>"
let g:UltiSnipsJumpBackwardTrigger="<C-[>"

" airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:tmuxline_theme='airline'
let g:tmuxline_preset = 'powerline'
let g:tmuxline_powerline_separators = 1
let g:promptline_powerline_symbols = 1
let g:airline#extensions#tmuxline#enabled = 0
"let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:cmdline_in_buffer = 0

filetype plugin indent on
syntax on

let g:django_projects = expand('~/Programming')

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
if v:version >= 703
    set colorcolumn=85
endif

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
" Smart way to move btw. windows
"nnoremap <C-j> <C-W>j
"nnoremap <C-k> <C-W>k
"nnoremap <C-h> <C-W>h
"nnoremap <C-l> <C-W>l
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

" c++
autocmd FileType cpp set equalprg=astyle

" View opts -------------------------------------------------------------------
let g:Guifont='Menlo:h12'
if has("gui_running")
    "set noantialias " Terminus looks better that way
    "set guioptions-=T
    "set guioptions-=L
    "set guioptions-=r
    "set fuopt+=maxhorz
else
    "set t_Co=256
endif
" Tag list settings -----------------------------------------------------------
let Tlist_Use_Right_Window=1
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=1
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
"set nofoldenable
nnoremap <silent> <leader>fe :set foldenable!<cr>:call ToggleFoldColumn()<cr>
nnoremap <leader>e za

vnoremap <leader>e zf

"set foldcolumn=1
"set foldmethod=marker
set nofoldenable

" Less
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.ino set filetype=c


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

" tagbar
"let g:tagbar_ctags_bin=expand('~/.brew/bin/ctags')
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd FileType * nested :call tagbar#autoopen(0)

"autocmd! BufWritePost * Neomake
au BufWrite * :Autoformat

nnoremap <leader>jd :YcmCompleter GoTo<CR>

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

autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:android_sdk_path = expand("~/Library/Android/sdk/")
let g:gradle_daemon=1
let g:gradle_quickfix_show=1
"let g:gradle_bin = expand('~/.brew/bin/gradle')


nnoremap <Leader>co :CMakeCompile<CR>

nnoremap <Leader>q :Bdelete<CR>
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
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

"autocmd CursorHold * nested :w
let g:clang_doxygen_libclang_library_path = g:brew_path + "/opt/llvm/lib/"
let g:chromatica#libclang_path = g:brew_path + "/opt/llvm/lib/"
let g:chomatica#responsive_mode=1
"set list lcs=trail:¶
autocmd BufWritePre * :%s/\s\+$//e

autocmd! FocusLost * redraw
"autocmd FileType cpp ChromaticaStart
au CompleteDone * pclose!
nnoremap <leader>c :!cargo clippy
