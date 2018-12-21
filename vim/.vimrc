
set nocompatible
filetype off

if has('unix') && empty($TMPDIR)
  let $TMPDIR = '/tmp'
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ------Plugins-------
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
Plugin 'christoomey/vim-run-interactive'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'airblade/vim-gitgutter'
Plugin 'colors'

call vundle#end()

" list of themes
" https://github.com/flazz/vim-colorschemes/tree/master/colors
colorscheme dracula
"colorscheme github
filetype plugin indent on

imap jj <Esc>

syntax enable
set tags=tags
set backspace=indent,eol,start
" let mapleader = ','
let mapleader = "\<Space>"
set number
set ignorecase
set smartcase
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

"--------------------Indenting--------------------------------

filetype plugin indent on
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,precedes:«,extends:»

" make chars blend in more with background
hi Whitespace ctermfg=DarkGray
match Whitespace /\s/
" NERDTree
nnoremap <C-l> :NERDTreeToggle<CR>
nmap <Leader>l :NERDTreeToggle<CR>

" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y
" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>

nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>

"-------------Mappings--------------"
" Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>w :bd<cr>
nmap <Leader>s :w<cr>

" FZF
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
set rtp+=~/.fzf
nnoremap <C-p> :GFiles<CR>
nmap <C-t> :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <C-e> :History<CR>


"-------------Split Management--------------"
"set splitbelow
set splitright

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"-------------Auto-Commands--------------"
""Automatically source the Vimrc file on save.

augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END


" Notes and Tips
"
" gg == Top of file
" G == Bottom of file
" zz == center window to cursor 
" ctrl + ] == go to definition
" ctrl + ^ == go to last edit 
" y$ == yank to end of line
"
