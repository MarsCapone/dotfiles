call plug#begin( stdpath('data') . '/plugged' )

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'skielbasa/vim-material-monokai'
"Plug 'dracula/vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'github/copilot.vim'

call plug#end()

" setup cursor
set guicursor=n-v-c-i-ci-sm-ve:block-blinkon0,r-cr-o:hor20

colorscheme material-monokai
let g:airline_theme = 'base16_monokai'

filetype plugin indent on

set expandtab           " tabs become spaces
set shiftwidth=4        " tab size
set tabstop=4           " how many characters does a tab count for
set autoindent          " keep indent on next line
set smartindent         " guess what the indent should be

set textwidth=0         " disable automatic wrapping
set showbreak=..        " show when text is wrapped
set wrap linebreak nolist  " softwrap without changing actual text
set wrapmargin=0        " don't add any extra indent when wrapping as we already have
                        " the `..` at the start

set laststatus=2        " always show the status bar
set shortmess+=I        " don't show text when opening new file

set hlsearch            " highlight search
set incsearch           " incremental search

set number              " add line numbers
set colorcolumn=100     " set a column border
set mouse=a             " allow mouse click
set backspace=2         " allow backspace across newlines

set novisualbell        " don't flash on error
set noerrorbells        " don't make a sound
set noshowmode          " don't show the mode because we have airline
set nofoldenable        " don't fold files

if has("syntax")
  syntax on
endif

" Jump to the last location when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" airline theme
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_statusline_ontop = 0
