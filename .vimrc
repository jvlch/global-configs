syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set t_Co=256
set ts=2 sw=2
set updatetime=50
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
set clipboard+=unnamedplus
set cmdheight=2
set completeopt=longest,menuone
set timeout timeoutlen=500
set mouse=a
set shortmess+=c


" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.d\.ts$[[file]]','\.js.map$[[file]]']
let g:indent_guides_auto_colors = 0
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'


let g:indent_guides_enable_on_vim_startup = 1 
let mapleader = "\<Space>" 
let g:typescript_compiler_binary = 'tsc'
let g:lightline = { 'active': {'left': [ [ 'mode', 'paste' ], ['gitbranch','readonly','filename','modified' ]]}, 'component_function': {'gitbranch':'gitbranch#name'},}
let g:wheel#map#up   = '<c-k>'
let g:wheel#map#down = '<c-j>'
let g:wheel#map#mouse = 1


call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'reedes/vim-wheel'
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'Shougo/denite.nvim'
Plug 'bling/vim-bufferline'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'tveskag/nvim-blame-line'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'stsewd/fzf-checkout.vim'
call plug#end()

colorscheme gruvbox
set background=dark

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey58   ctermbg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey66 ctermbg=235
autocmd FileType typescript setlocal completeopt+=menu,preview

nnoremap <SPACE> <Nop>
nnoremap H gT
nnoremap L gt

map <C-p> :NERDTreeToggle<CR>
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
  " \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'


"ALL LEADER REMAPS

" Enable blame line
nnoremap <silent> <leader>z :ToggleBlameLine<CR>


" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

"delete current buffer
nmap <leader>w :bd<CR>

"show all buffers"
nmap <leader>qa :Buffers<CR>

" Show all open buffers and their status
nmap <leader>ql :ls<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>qc :bp <BAR> bd #<CR>

"Restart coc
nnoremap <leader>cr :CocRestart<CR>

"GoTo code navigation, coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)

""open git status"
nmap <leader>gs :G<CR>
""accept merge from left side"
nmap <leader>gh :diffget //2<CR>
""accept merge from right side"
nmap <leader>gl :diffget //3<CR>

""Open GFiles"
nmap <leader>p :Files<CR>

""coc rename
nmap <leader>rr <Plug>(coc-rename)

"tab navigation"
nmap <leader>ty :tabclose<CR>
nmap <leader>tu :tabnew<CR>
nmap <leader>tk :tabprevious<CR>
nmap <leader>tl :tabnext<CR>

"window navigation
nmap <leader>wh :wincmd h<CR>
nmap <leader>wj :wincmd j<CR>
nmap <leader>wk :wincmd k<CR>
nmap <leader>wl :wincmd l<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

com! W w
