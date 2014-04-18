" VIM runtime configuration
" Jacob Rothenbuhler


" Pathogen initialization
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()


" syntax highlighting
syntax on
colorscheme base16-default


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
set wildignore+=*.pyc

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l


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


" NERD Tree plugin
nnoremap <leader>nt :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.pyc$', '^\.git$', '^\.svn$', '^\.\+$', '\~$', '\.swp$']
let NERDTreeShowHidden=1


" Syntastic plugin
let g:syntastic_python_checkers=['flake8']
let g:syntastic_always_populate_loc_list=1


" Markdown todo lists
nnoremap <leader>tc o- TODO 
nnoremap <leader>tC O- TODO 
nnoremap <leader>tt 0wcwTODO<esc>
nnoremap <leader>tn 0wcwNEXT<esc>
nnoremap <leader>td 0wcwDONE []<esc>"=strftime("%Y-%m-%d")<CR>P
