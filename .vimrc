" VIM runtime configuration
" Jacob Rothenbuhler


" Pathogen initialization
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()


" syntax highlighting
syntax on
colorscheme ir_black


" filetype initialization
filetype plugin indent on


" interface/behavior
set hidden
set incsearch
set laststatus=2
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set ruler
set showcmd
set wildignore+=*.pyc,*.orig,*/node_modules/*,*/bower_components/*

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
if has('nvim')
    " workaround for <c-h> mapping issue
    " https://github.com/neovim/neovim/issues/2048
    nnoremap <bs> <c-w>h
endif


" editing
set autoread
set backspace=indent,eol,start
if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2


" NERD Tree plugin
nnoremap <leader>nt :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$', '^\.git$', '^\.svn$', '^\.\+$', '\~$', '\.swp$']
let NERDTreeShowHidden=1


" Neomake plugin
autocmd! BufWritePost * Neomake
