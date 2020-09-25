" ~/.vimrc
"
execute pathogen#infect()
syntax enable
set background=dark
colorscheme solarized
filetype plugin indent on

set encoding=utf-8

set backspace=indent,eol,start

set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
"
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"
set tags^=.git/tags
"
let g:html_indent_tags = 'li\|p'
"
" " Leader
let mapleader = " "
"
" http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
 " Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

let g:ale_fix_on_save = 1
let g:ale_fixers = {'javascript': ['prettier'], 'vue': ['prettier'], 'css': ['prettier']}

:imap jj <Esc>
