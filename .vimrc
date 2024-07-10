let mapleader=" "
nnoremap <SPACE> <Nop>

filetype plugin indent on
hi Normal guibg=NONE ctermbg=NONE
nnoremap <silent> <Esc> <Esc>:noh<CR>
set autoread
set backspace=indent,eol,start
set breakindent
set complete+=i,kspell
set completeopt=menuone,noselect
set formatoptions+=j
set history=1000
set ignorecase
set incsearch
set laststatus=3
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set path+=**
set nu
set rnu
set scrolloff=4
set smartcase
set smarttab
set termguicolors
set ttimeout
set ttimeoutlen=300
set updatetime=250
set wildmenu
set cursorline
set cursorcolumn
syntax enable

" better windows navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" better indenting
vnoremap < <gv
vnoremap > >gv

" better window resizing
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" better tabbing
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <Leader>bd :bdelete<CR>

" remap jk to escape
inoremap jk <Esc>
inoremap kj <Esc>

set splitbelow
set splitright