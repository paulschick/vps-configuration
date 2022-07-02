let mapleader = " "

:set ignorecase
:set hlsearch
:set mouse=a
:set smartcase
:set smartindent
:set splitbelow
:set splitright
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set nu
:set rnu
:set wrap
:set background=dark
:set autochdir

nnoremap <Leader>s :source ~/.vimrc<CR>
inoremap jk <Esc>
nnoremap <Leader>e :Lexplore<CR>
nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <Leader><Space> :noh<CR>

" Block cursor in normal mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
