source ~/.vim_github_issues
" indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'

let g:gissues_async_omni = 1
let g:gissues_lazy_load = 1
Plug 'jaxbot/github-issues.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
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
let g:clamp_libclang_file = '/Users/d1ff/.vim/plugged/YouCompleteMe/third_party/ycmd/libclang.dylib'
Plug 'bbchung/Clamp'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<C-x><C-x>"
let g:UltiSnipsJumpForwardTrigger="<C-]>"
let g:UltiSnipsJumpBackwardTrigger="<C-[>"
Plug 'solarnz/thrift.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

call plug#end()

let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 1
let g:promptline_powerline_symbols = 1
let g:ycm_confirm_extra_conf = 0
let g:airline#extensions#tabline#enabled = 1
let g:cmdline_in_buffer = 0

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

filetype plugin indent on
syntax on


let g:colorsamplerpack_loaded = 1
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
"nnoremap <C-j> <C-W>j
"nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
"nnoremap <C-l> <C-W>l
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

nmap <leader>cd :FufDir<CR>
nmap <leader>of :FufFile<CR>
nmap <leader>bu :CtrlSpace<CR>
nmap <leader>er :Error<CR>
nnoremap <silent> <leader>nt :NERDTreeToggle %:p:h<CR>
nnoremap <silent> <leader>tl :TagbarToggle<CR>

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

" View opts -------------------------------------------------------------------
set background=dark
if has("gui_running")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12
    "set noantialias " Terminus looks better that way
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set fuopt+=maxhorz
else
  set t_Co=256
endif
let base16colorspace=256
colorscheme base16-default

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

"" tagbar
autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)

autocmd! BufWritePost * Neomake

nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Vimux

nnoremap <leader>rp :VimuxPromptCommand<CR>
nnoremap <leader>rl :VimuxRunLastCommand<CR>

" EasyMotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

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
