" set spell
set nospell
set spelllang=en_us
" set relativenumber number numberwidth=3
let g:mapleader=' '
set mouse=
set iskeyword+=-
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab shiftround
set tags+=tags;
set ff=unix
" set list
set nowrap
set autoindent smartindent
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set directory=~/.vim/swp
" set virtualedit=all
let g:python3_host_prog="/usr/bin/python3"

"https://stackoverflow.com/questions/15962421/how-can-i-disable-scratch-preview-window
set completeopt-=preview

"set foldmethod=manual nofoldenable
set foldmethod=indent
set foldlevelstart=3
set foldnestmax=3
set conceallevel=0

set hlsearch

syntax on
set termguicolors
autocmd vimenter * hi Normal guibg=NONE ctermbg=None
" highlight Normal guibg=none
" highlight NonText guibg=none

let g:indentLine_setConceal=0
autocmd Filetype json setlocal conceallevel=0
autocmd Filetype json let g:indentline_setConceal=0

" save automatically when text is changed
set updatetime=60000
au CursorHold * silent! update

nnoremap # <nop>
nnoremap # 10@@

let @n = 'n.'
let @f = ';.'

nnoremap s <nop>
let @s = "e."
nnoremap s ea

nnoremap <C-j> <nop>
inoremap <C-j> <nop>
nnoremap <C-k> <nop>
inoremap <C-k> <nop>
nnoremap <leader>h <Nop>
nnoremap <leader>l <Nop>

nnoremap <C-q> :q<cr>
nnoremap <leader>no :noh<Cr>


nnoremap <leader>j 5j
nnoremap <leader>k 5k
nnoremap <leader>h 5b
nnoremap <leader>l 5w
inoremap <C-f> <right>

nnoremap <F2> :wa<cr>
inoremap <F2> <Esc>:wa<cr>

vmap <leader>a "ay<CR>
nnoremap <leader>v "ap
nnoremap <leader>d yyp

nnoremap <leader>; A;<ESC>^
nnoremap <leader>, A,<ESC>^
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <leader>i i<Space><Esc>i
inoremap <C-j> <CR><C-o><S-o>

nnoremap K <nop>
nnoremap K k<S-j>

nnoremap zl <nop>
nnoremap zh <nop>
nnoremap zl zL
nnoremap zh zH

nnoremap gn :cn <cr> : normal! zz <cr>
nnoremap gp :cp <cr> : normal! zz <cr>
nnoremap <leader>gc :cclose<cr>
nnoremap <leader>go :copen<cr>
nnoremap <F9> <nop>
nnoremap <F9> :call ToggleQuickfixList()<cr>
nnoremap <F10> <nop>
nnoremap <F10> :set relativenumber! number!<cr>

call plug#begin('~/.config/nvim/.plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'milkypostman/vim-togglelist'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'}

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-markdown'
Plug 'sbdchd/neoformat'

Plug 'leafgarland/typescript-vim'

Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
" Plug 'phaazon/hop.nvim'

Plug 'morhetz/gruvbox'
Plug 'tribela/vim-transparent'
call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg = 1

" NERDTree settings
nnoremap <F3> <nop>
nnoremap <F3> :NERDTreeToggle <CR>
nnoremap <C-w>t :NERDTreeToggle <CR>
nnoremap <leader>nt :NERDTree <CR>
nnoremap <leader>f  :NERDTreeFind <CR>

let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['python']

let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeCascadeOpenSingleChildDir = 0
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeMinimalMenu=20
let g:NERDTreeStatusline="\ %-28{matchstr(getline('.'), '\\(\\s\\)\\?\\zs\\(\\/\\)\\?\\w\\(.*\\)')}"
let g:NERDTreeWinSize=31

" FZF CONFIGURATION
let g:fzf_preview_window = ['right:hidden', 'ctrl-/']
command! MYFZF call fzf#run(fzf#wrap({'source': 'git ls-files'}))
" nnoremap <silent> <c-j> :FZF --tiebreak=begin,length,index<cr>
nnoremap <silent> <c-j> :MYFZF<cr>
nnoremap <silent> <c-k> :Buffers<cr>
nnoremap <silent> <c-n> :BLines<cr>


" default
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']

nmap <F8> :TagbarToggle<cr>

let g:gutentag_file_list_command = 'git ls-files'
let g:gutentag_generate_on_missing = 0
let g:gutentag_generate_on_new = 0
let g:gutentag_generate_on_write = 0

" lua require'hop'.setup()
" nnoremap <c-h> :<nop>
" nnoremap <c-h> :HopChar2<cr>

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


let g:neosnippet#enable_snipmate_compatibility = 1

" FOR JUPYTER NOTEBOOK EDITING:
"
" Edit on markdown file, convert to ipynb format
" - pip install --user jupytext

function Sync_Markdown_Ipybn()
    silent execute "!jupytext --sync " . @%
endfunction

function Create_New_Ipynb()
    let s:rootname = expand("%:p:r")
    let s:filename = s:rootname . '.ipynb'
    if !filereadable(s:filename)
        execute "!jupytext --to notebook " . @%
        execute "!jupytext --set-formats md,ipynb " . @%
:   endif
endfunction

if executable('jupytext')
autocmd BufRead,BufNewFile *__2nb__.md :call Create_New_Ipynb()
autocmd BufWritePost *__2nb__.md :call Sync_Markdown_Ipybn()
endif


