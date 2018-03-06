call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'Shougo/neocomplete'
Plug 'skielbasa/vim-material-monokai'

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


" Set the colorscheme
set background=dark
set termguicolors
colorscheme material-monokai

set textwidth=0 			" Unset automatic wrapping
set showbreak=.. 			" Show .. when text is wrapped round
set wrap linebreak nolist 		" Softwrap lines without changing actual text
set wrapmargin=0 			" Don't add any extra indent when wrapping, because
					" we already have the .. at the start
					" of wrapped lines.

set laststatus=2 			" Always show the status bar
set encoding=utf-8			" Use UTF-8 as encoding
set colorcolumn=80			" Highlight column 80

set tabstop=2 				" A tab is 4 spaces
set expandtab 				" Always use spaces when typing a tab
set shiftwidth=2 			" Text is indented 4 spaces
au FileType python setlocal ts=4 sts=4 sw=4 expandtab

set showmatch 				" Show matching brackets
set incsearch 				" Incremental search
set hlsearch 				" Highlight search terms
set mouse=a				" Enable mouse in all modes
set number 				" Show line numbers
set relativenumber 			" Show relative line numbers
set shortmess+=I			" Don't show text when opening a new file
set pastetoggle=<F3> 			" <F3> toggles paste mode
set ttimeoutlen=50 			" Fix delay when leaving INSERT mode

set history=1000			" Keep a long history
set undolevels=1000 			" Undo a long way

set title				" Title is filename and path of edited file

set novisualbell 			" Don't flash the screen when there is an error
set noerrorbells 			" Don't make any noise either
set noshowmode


" Plugin Specific Settings
"

" NerdTree
" ========

" nt to toggle nerd tree
map nt :NERDTreeToggle<CR> 		


" Vim Airline
" ===========

let g:airline_theme='materialmonokai'
let g:airline_section_z='%l/%L : %c'

" NeoComplete
" ===========

" Use neocomplete
let g:neocomplete#enable_at_startup = 1
" Use smartcase
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Tab completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Undo completion 
inoremap <expr><C-g> neocomplete#undo_completion()
" Other
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
