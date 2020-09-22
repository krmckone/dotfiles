set encoding=utf-8

set backspace=indent,eol,start

set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set tags^=.git/tags

let g:html_indent_tags = 'li\|p'

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
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

call plug#begin('~/.vim/bundle')
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dense-analysis/ale'
Plug 'leafoftree/vim-vue-plugin'
Plug 'tpope/vim-surround'
call plug#end()

let g:vim_vue_plugin_highlight_vue_attr	= 1
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:go_fmt_command = "goimports"
let g:ale_fix_on_save = 1
let g:ale_fixers = {'javascript': ['prettier'], 'vue': ['prettier'], 'css': ['prettier']}
set rtp+=/usr/local/opt/fzf

imap jj <Esc>
