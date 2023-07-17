call plug#begin(stdpath('data') . '/plugged')

  Plug 'vim-airline/vim-airline'
  Plug 'skielbasa/vim-material-monokai'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

filetype plugin indent on

" Set syntax if available
if has("syntax")
   syntax on
endif

" Jump to the last position when reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" setup cursor
set guicursor=n-v-c-i-ci-sm-ve:block-blinkon0,r-cr-o:hor20

" colorscheme
set background=dark
set termguicolors
colorscheme material-monokai
let g:airline_theme='materialmonokai'
let g:materialmonokai_subtle_airline=1

" ===
" Plugin specific settings
" ===

" airline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_statusline_ontop = 0

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 50)

" ===
" Other settings
" ===
set textwidth=0                   " Unset automatic wrapping
set showbreak=..                  " Show .. when text is wrapped round
set wrap linebreak nolist         " Softwrap lines without changing actual text
set wrapmargin=0                  " Don't add any extra indent when wrapping, 
                                  " because we already have the .. at the start
                                  " of wrapped lines.

set laststatus=2 		  " Always show the status bar
set encoding=utf-8                " Use UTF-8 as encoding
set colorcolumn=80                " Highlight column 80

set tabstop=2                     " A tab is 4 spaces
set expandtab                     " Always use spaces when typing a tab
set shiftwidth=2                  " Text is indented 4 spaces

set showmatch                     " Show matching brackets
set incsearch                     " Incremental search
set hlsearch                      " Highlight search terms
set mouse=a                       " Enable mouse in all modes
set number                        " Show line numbers
"set relativenumber                " Show relative line numbers
set shortmess+=I                  " Don't show text when opening a new file
set pastetoggle=<F3>              " <F3> toggles paste mode
set ttimeoutlen=50                " Fix delay when leaving INSERT mode
set bs=2                          " Allow backspacing

set history=1000                  " Keep a long history
set undolevels=1000               " Undo a long way

set title                         " Title is filename and path of edited file

set novisualbell                  " Don't flash the screen when there is an error
set noerrorbells                  " Don't make any noise either
set noshowmode                    " Don't show mode under airline
set nofoldenable                  " Never fold files

" Filetype settings
au FileType python    set ts=4 sts=4 sw=4 tw=100 expandtab


