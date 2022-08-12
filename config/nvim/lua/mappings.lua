local vim = vim

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

api.nvim_set_keymap("n", "<leader>o", "<cmd>Telescope find_files<CR>", { silent = true })
api.nvim_set_keymap("n", "<leader>t", "<cmd>Telescope tags<CR>", { silent = true })
api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<CR>", { silent = true })

-- nmap <leader>er :Error<CR>

api.nvim_set_keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<leader>tl", ":TagbarToggle<CR>", { noremap = true, silent = true })

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
map  <Leader><space> <Plug>(easymotion-bd-f)
nmap <Leader><space> <Plug>(easymotion-overwin-f)

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
]])

-- Lua
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

api.nvim_set_keymap("n", "<leader>1", "<cmd>DocsViewToggle<CR>", { noremap = true })
