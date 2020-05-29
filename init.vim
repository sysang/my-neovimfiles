" START

set spelllang=en_us
set spell
set relativenumber number numberwidth=3
set termguicolors
let g:mapleader=' '
set iskeyword+=-
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab shiftround
set tags=phptags,jstags,pytags
set ff=unix
set list
set nowrap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set directory=~/.vim/swp
" set backupdir=~\.vim\backup
" set undodir=~\.vim\undo
" set directory=~\.vim\swp
syntax on

"https://stackoverflow.com/questions/15962421/how-can-i-disable-scratch-preview-window
set completeopt-=preview

"set foldmethod=manual nofoldenable
set foldmethod=indent
set foldlevelstart=1
set foldnestmax=3

let g:vim_json_syntax_conceal = 0
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['python', 'bash=sh']

nnoremap <leader>tp :AsyncRun ctags --langmap=php:.engine.inc.module.theme.install.php --php-kinds=cdfi --languages=php --recurse --fields=+l -f phptags . <CR>
nnoremap <leader>ty :AsyncRun ctags  --python-kinds=-iv --languages=python --recurse --fields=+l --exclude=.git -f pytags . <CR>

nnoremap K <nop>
nnoremap t <nop>
nnoremap <C-j> <nop>
inoremap <C-j> <nop>
nnoremap <C-k> <nop>
inoremap <C-k> <nop>
nnoremap <C-q> :q<cr>

nnoremap <leader>hn :noh<Cr>

nnoremap <leader>j 5j
nnoremap <leader>k 5k
nnoremap <leader>h 5b
nnoremap <leader>l 5w
inoremap <C-l> <right>

nnoremap <C-a> :w<cr>
inoremap <C-a> <Esc>:w<cr>
vmap <C-s>c "+y<CR>
nnoremap <C-s>v "+p
inoremap <C-s>v <C-R>+

vmap <leader>a "ay<CR>
nnoremap <leader>v "ap
nnoremap <leader>d yyp

nnoremap <leader>; A;<ESC>
nnoremap <leader>, A,<ESC>
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <leader>i i<Space><Esc>i
nnoremap <S-k> k<S-j>
inoremap <S-CR> <CR><C-o><S-o>

nnoremap <leader>gc :ccl<cr>
nnoremap <leader>go :copen<cr><C-w><C-o>

nnoremap <C-left> z10l
nnoremap <C-right> z10h

nnoremap <leader>w :cd C:\Users\dsysang\workspace<cr>:NERDTree <cr>

nnoremap tt gt
nnoremap tn :tabnew<cr>

" save automatically when text is changed
set updatetime=400
au CursorHold * silent! update

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Required:
"https://github.com/neovim/python-client
"https://github.com/davidhalter/jedi
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-tag'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'shawncplus/phpcomplete.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'evidens/vim-twig'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'vim-python/python-syntax'

Plug 'yggdroot/indentline'

Plug 'tpope/vim-fugitive'

Plug 'skywind3000/asyncrun.vim'

" Initialize plugin system
call plug#end()

" NERDTree settings
nnoremap <leader>nt :NERDTree <CR>
nnoremap <leader>p :NERDTreeToggle <CR>
nnoremap <leader>f  :NERDTreeFind <CR>

let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeCascadeOpenSingleChildDir = 0
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeStatusline="\ %-28{matchstr(getline('.'), '\\(\\s\\)\\?\\zs\\(\\/\\)\\?\\w\\(.*\\)')}"
let g:NERDTreeWinSize=40

if filereadable('mix.exs')
  call add(g:NERDTreeIgnore, '_build')
end

aug user:autocmd:nerdtree
  au!
  au CursorMoved *NERD_tree*
              \ let s:NERDTreeCurrentLine=line('.')
  au BufEnter *NERD_tree*
              \ if exists('s:NERDTreeCurrentLine') && s:NERDTreeCurrentLine > 0 |
              \   call setpos('.', [0, s:NERDTreeCurrentLine, 1, 0]) |
              \ end
  au BufDelete,BufWipeout *NERD_tree*
              \ if exists('g:nerdtree_current_buffer') |
              \   unlet g:nerdtree_current_buffer |
              \ end
  au Filetype nerdtree setlocal nolist
aug END

nnoremap <silent> <c-j> :FZF --tiebreak=begin,length,index<cr>
nnoremap <silent> <c-k> :Buffers<cr>
nnoremap <silent> <c-n> :BLines<cr>

" NeoSolarized settings
" colorscheme NeoSolarized
" set background=dark
" set synmaxcol=300

" default value is "normal", Setting this option to "high" or "low" does use the 
" same Solarized palette but simply shifts some values up or down in order to 
" expand or compress the tonal range displayed.
" let g:neosolarized_contrast = "high"

" Special characters such as trailing whitespace, tabs, newlines, when displayed 
" using ":set list" can be set to one of three levels depending on your needs. 
" Default value is "normal". Provide "high" and "low" options.
" let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
" let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized 
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:  
" let g:neosolarized_bold = 1
" let g:neosolarized_underline = 1
" let g:neosolarized_italic = 0

"One Dark them setting
let g:onedark_color_overrides = {"white": { "gui": "#ABB2BF", "cterm": "253", "cterm16": "7" }, "visual_black": { "gui": "NONE", "cterm": "189", "cterm16": "0" }}
syntax on
colorscheme onedark

" Fix wrong color in mosh
set notermguicolors

if has("autocmd")
" Drupal *.module and *.install files.
augroup module
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.view set filetype=php
augroup END
endif


" The Silver Searcher
" git@github.com:sysang/my-neovimfiles.git
if executable('ag')
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor
endif

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

let g:neosnippet#snippets_directory='/home/sysang/.config/nvim/snippets'

" For conceal markers.
if has('conceal')
set conceallevel=2 concealcursor=niv
endif

" For jupyter notebook editing:
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
autocmd BufRead,BufNewFile *-ann.md :call Create_New_Ipynb()
autocmd BufWritePost *-ann.md :call Sync_Markdown_Ipybn()
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources._ = ['buffer', 'tag', 'ultisnips']

let g:deoplete#sources#jedi#enable_typeinfo = 0
