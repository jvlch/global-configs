filetype plugin on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set t_Co=256
set ts=2 sw=2
set showmatch
set expandtab
set wrap
set autoindent
set copyindent
set number
set smartcase
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set ruler
set smarttab
set laststatus=2
set noshowmode
set relativenumber

map <C-p> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let g:solarized_termcolors=256
let g:indent_guides_auto_colors = 0
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0


autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey58   ctermbg=253
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey66 ctermbg=230
autocmd FileType typescript setlocal completeopt+=menu,preview

let g:indent_guides_enable_on_vim_startup = 1 
let mapleader=","
let g:typescript_compiler_binary = 'tsc'
set timeout timeoutlen=1500
let g:lightline = { 'active': {'left': [ [ 'mode', 'paste' ], ['gitbranch','readonly','filename','modified' ]]}, 'component_function': {'gitbranch':'gitbranch#name'},}

set mouse=a
let g:wheel#map#up   = '<c-k>'
let g:wheel#map#down = '<c-j>'
let g:wheel#map#mouse = 1
let g:deoplete#enable_at_startup = 1

set completeopt=longest,menuone

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
  \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

nnoremap H gT
nnoremap L gt
nnoremap <C-y> :tabclose<CR>
nnoremap <C-u> :tabnew<CR>
nnoremap <C-i> :tabprevious<CR>
nnoremap <C-o> :tabnext<CR>

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

syntax enable

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'reedes/vim-wheel'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'bling/vim-bufferline'
Plug 'michaeljsmith/vim-indent-object'


call plug#end()

set background=light
colorscheme solarized
