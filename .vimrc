syntax on
filetype plugin indent on

""""
""""
"PLUGS
""""
""""
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'reedes/vim-wheel'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'bling/vim-bufferline'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'tveskag/nvim-blame-line'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'SirVer/ultisnips'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'easymotion/vim-easymotion'
call plug#end()

""""
""""
"GENERAL SETS
""""
""""
set autoindent
set clipboard+=unnamedplus
set cmdheight=2
set completeopt=longest,menuone
set copyindent
set expandtab
set history=1000
set laststatus=2
set mouse=a
set nobackup
set noerrorbells
set noshowmode
set noswapfile
set number relativenumber
set omnifunc=syntaxcomplete#Complete
set ruler
set shortmess+=c
set showmatch
set smartcase
set smarttab
set t_Co=256
set timeout timeoutlen=500
set title
set ts=2 sw=2
set undolevels=1000
set updatetime=50
set visualbell
set wrap
set background=dark
set hidden

""""
""""
"general lets
""""
""""
let mapleader = "\<Space>" 

let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'

let g:typescript_compiler_binary = 'tsc'

let g:wheel#map#up   = '<c-k>'
let g:wheel#map#down = '<c-j>'
let g:wheel#map#mouse = 1


""""
""""
"color schemes
""""
""""

colorscheme gruvbox

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey58   ctermbg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey66 ctermbg=235
autocmd FileType typescript setlocal completeopt+=menu,preview

nnoremap <SPACE> <Nop>
nnoremap H gT
nnoremap L gt


""""
""""
"lightline
""""
""""
let g:lightline = { 'active': {'left': [ [ 'mode', 'paste' ], ['gitbranch','readonly','absolutepath','modified' ]]}, 'component_function': {'gitbranch':'gitbranch#name'},}

""""
""""
"indent line
""""
""""
let g:indentLine_setColors = 0

""""
""""
"gitgutter
""""
""""
let g:gitgutter_max_signs=9999

""""
""""
"nerdtree
""""
""""
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.d\.ts$[[file]]','\.js.map$[[file]]','node_modules','\.rush']

map <C-p> :NERDTreeToggle<CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
  \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'


""""
""""
"blameline
""""
""""

" Enable blame line
nnoremap <silent> <leader>z :ToggleBlameLine<CR>
nnoremap <c-z> :u<CR> 


""""
""""
"general navigation
""""
""""

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


""""
""""
"easymotion
""""
""""

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <Leader>ss <Plug>(easymotion-overwin-f2)
nmap <Leader>sw <Plug>(easymotion-bd-wl)
nmap <Leader>sj <Plug>(easymotion-j)
nmap <Leader>sk <Plug>(easymotion-k)

""""
""""
"coc
""""
""""

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
""coc rename
nmap <leader>rr <Plug>(coc-rename)

"Restart coc
nnoremap <leader>cr :CocRestart<CR>

""""
""""
"fugitive/git
""""
""""

""open git status"
nmap <leader>gs :G<CR>
""accept merge from left side"
nmap <leader>gh :diffget //2<CR>
""accept merge from right side"
nmap <leader>gl :diffget //3<CR>
nmap <leader>md <Plug>MarkdownPreviewToggle

""""
""""
"fzf
""""
""""

""FZF search all Files"
nmap <leader>o :Files<CR>

""FZF search GitFiles"
nmap <leader>p :GFiles<CR>


""""
""""
"ultisnips
""""
""""
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsEditSplit="vertical"

nmap <leader>ue :UltiSnipsEdit<CR>

""""
""""
"maximizer
""""
""""

nmap <Leader>m :MaximizerToggle<CR>

"debugging with vimspector
" nmap <Leader>dr :VimspectorReset<CR>
" nmap <Leader>ds :VimspectorShowOutput<CR>
" nmap <Leader>de :VimspectorEval<CR>
" nmap <Leader>dw :VimspectorWatch<CR>
" nmap <Leader>di <Plug>VimspectorBalloonEval
" xmap <Leader>di <Plug>VimspectorBalloonEval

""""
""""
"whitespace trim
""""
""""
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

""""
"TODO something with W?
""""
com! W w

""""
""""
"json as jsonc
""""
""""

augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END

""""
""""
"columns
""""
""""

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" vimspector layout
" scriptencoding utf-8
" set noequalalways

" let g:vimspector_enable_mappings = 'HUMAN'
" let s:vimspector_path = expand( '<sfile>:p:h:h' )

" function! s:CustomiseUI()
"   let wins = g:vimspector_session_windows

"   " Close the Variables window
"   if has( 'nvim' )
"     " No win_execute in neovim
"     call win_gotoid( wins.variables )
"     quit
"   else
"     call win_execute( wins.variables, 'q' )
"   endif

"   " Put the stack trace at the top of the "left bar" (rotate)
"   call win_gotoid( wins.stack_trace )
"   wincmd r

"   " Make the left column at least 70 chars
"   70wincmd |

"   " Make the code window at least 80 chars
"   call win_gotoid( wins.code )
"   80wincmd |

"   " Make the output window 10 lines high and right at the top of the screen
"   call win_gotoid( wins.output )
"   10wincmd _
"   wincmd K
" endfunction

" function s:SetUpTerminal()
"   if !has_key( g:vimspector_session_windows, 'terminal' )
"     " There's a neovim bug which means that this doesn't work in neovim
"     return
"   endif
"   let terminal_win = g:vimspector_session_windows.terminal

"   " Make the terminal window at most 80 columns wide, ensuring there is enough
"   " sapce for our code window (80 columns) and the left bar (70 columns)

"   " Padding is 2 for the 2 vertical split markers and 2 for the sign column in
"   " the code window.
"   let left_bar = 70
"   let code = 80
"   let padding = 4
"   let cols = max( [ min( [ &columns - left_bar - code - padding, 80 ] ), 10 ] )
"   call win_gotoid( terminal_win )
"   execute cols . 'wincmd |'
" endfunction

" function! s:CustomiseWinBar()
"     call win_gotoid( g:vimspector_session_windows.code)
"     aunmenu WinBar
"     nnoremenu WinBar.▷\ ᶠ⁵ :call vimspector#Continue()<CR>
"     nnoremenu WinBar.↷\ ᶠ¹⁰ :call vimspector#StepOver()<CR>
"     nnoremenu WinBar.↓\ ᶠ¹¹ :call vimspector#StepInto()<CR>
"     nnoremenu WinBar.↑\ ˢᶠ¹¹ :call vimspector#StepOut()<CR>
"     nnoremenu WinBar.❘❘\ ᶠ⁶ :call vimspector#Pause()<CR>
"     nnoremenu WinBar.□\ ˢᶠ⁵ :call vimspector#Stop()<CR>
"     nnoremenu WinBar.⟲\ ᶜˢᶠ⁵ :call vimspector#Restart()<CR>
"     nnoremenu WinBar.✕\ ᶠ⁸ :call vimspector#Reset()<CR>
" endfunction

" augroup TestUICustomistaion
"   autocmd!
"   autocmd User VimspectorUICreated call s:CustomiseUI()
"   autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
"   autocmd User VimspectorUICreated call s:CustomiseWinBar()
" augroup END

" " }}}


" let g:vimspector_sign_priority = {
"   \    'vimspectorBP':         3,
"   \    'vimspectorBPCond':     2,
"   \    'vimspectorBPDisabled': 1,
"   \    'vimspectorPC':         999,
"   \ }

" " }}}

" let s:mapped = {}

" function! s:OnJumpToFrame() abort
"   if has_key( s:mapped, string( bufnr() ) )
"     return
"   endif

"   nmap <silent> <buffer> <LocalLeader>dn <Plug>VimspectorStepOver
"   nmap <silent> <buffer> <LocalLeader>ds <Plug>VimspectorStepInto
"   nmap <silent> <buffer> <LocalLeader>df <Plug>VimspectorStepOut
"   nmap <silent> <buffer> <LocalLeader>dc <Plug>VimspectorContinue
"   nmap <silent> <buffer> <LocalLeader>di <Plug>VimspectorBalloonEval
"   xmap <silent> <buffer> <LocalLeader>di <Plug>VimspectorBalloonEval

"   let s:mapped[ string( bufnr() ) ] = { 'modifiable': &modifiable }

"   setlocal nomodifiable

" endfunction

" function! s:OnDebugEnd() abort

"   let original_buf = bufnr()
"   let hidden = &hidden

"   try
"     set hidden
"     for bufnr in keys( s:mapped )
"       try
"         execute 'noautocmd buffer' bufnr
"         silent! nunmap <buffer> <LocalLeader>dn
"         silent! nunmap <buffer> <LocalLeader>ds
"         silent! nunmap <buffer> <LocalLeader>df
"         silent! nunmap <buffer> <LocalLeader>dc
"         silent! nunmap <buffer> <LocalLeader>di
"         silent! xunmap <buffer> <LocalLeader>di

"         let &l:modifiable = s:mapped[ bufnr ][ 'modifiable' ]
"       endtry
"     endfor
"   finally
"     execute 'noautocmd buffer' original_buf
"     let &hidden = hidden
"   endtry

"   let s:mapped = {}
" endfunction

" augroup TestCustomMappings
"   au!
"   autocmd User VimspectorJumpedToFrame call s:OnJumpToFrame()
"   autocmd User VimspectorDebugEnded call s:OnDebugEnd()
" augroup END



" let g:vimspector_mappings = {
"       \   'stack_trace': {},
"       \   'variables': {
"       \    'set_value': [ '<Tab>', '<C-CR>', 'C' ],
"       \   }
"       \ }


" " vim: foldmethod=marker
