" BASIC SETUP:

" enter the current millenium
set nocompatible
" 'normal' backspacing
set backspace=indent,eol,start
" enable syntax and plugins (for netrw)
syntax enable
set number
filetype off
set tabstop=2 shiftwidth=2 expandtab
let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
let g:ycm_confirm_extra_conf = 0 

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'mxw/vim-jsx'

Plugin 'pangloss/vim-javascript'

Plugin 'mattn/emmet-vim'

Plugin 'scrooloose/nerdtree'

Plugin 'w0rp/ale'

Plugin 'marijnh/tern_for_vim'

Plugin 'grassdog/tagman.vim'
" End configuration, makes the plugins available
call vundle#end()
filetype plugin indent on


" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" ALE fixer
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }

" config for NERDTree
nnoremap - :NERDTreeToggle<CR>
let NERDTreeIgnore=[',\(^\|\s\s\)\zs\.\S\+', 
      \'node_modules$[[dir]]',
      \'\.env$',
      \'tags']

" For JSX highlight
let g:jsx_ext_required = 0
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>8jwf>a
" calling ALEfixer
nnoremap ,f :ALEFix<CR> 
" for emmet vim
imap hh <c-y>,
vmap hh <c-y>,
" Manage split
nnoremap ,= <c-w>=
nnoremap ,[ <c-w>h
nnoremap ,] <c-w>l
" Manage reading pages
nnoremap ,. <c-b>
nnoremap ,<Space> <c-f>
" Move lines 
nnoremap ,k :m -2<CR>
nnoremap ,j :m +1<CR>
" Save and quit stuff
nnoremap ,/ :source $MYVIMRC<CR>
nnoremap ,v :vs ~/.vimrc<CR>
nnoremap ,q :q<CR>
nnoremap ,! :q!<CR>
nnoremap ,s :w<CR>
inoremap ,s <Esc>:w<CR>
inoremap jk <Esc>
"add snippet for class and react stuff
inoremap f<CR> function () {<CR>}<Esc>b4ha
inoremap l<CR> console.log();<Esc>F(a
inoremap r<CR> return 
"add auto pairing
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>bo
inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>bo
inoremap (= () => <Esc>F(a
inoremap [ []<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>
inoremap < <><Left>

" help trigger auto complete
imap ,m <c-Space>

" ctags
autocmd VimEnter * silent! !ctags 
nnoremap ,g <c-]>
nnoremap ,t <c-t>

" miscellanous
inoremap ,; <Esc>A;<Esc>
inoremap ,l <Esc>A
nnoremap = :pc<CR>
inoremap ,u <Esc>u

" missing comment stuff
