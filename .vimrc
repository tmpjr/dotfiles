call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'hdima/python-syntax'
Plug 'ervandew/supertab'
Plug 'alvan/vim-closetag'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-smooth-scroll'
Plug 'posva/vim-vue'

call plug#end()

set nocompatible

" Set swp directory to ~/.vim/swp
set directory=~/.vim/swp//

set encoding=utf-8
set backspace=indent,eol,start     " let the backspace key work normally
set hidden                         " hide unsaved buffers
set incsearch                      " incremental search rules
set hlsearch
set ignorecase
set smartcase
set laststatus=2                   " not strictly necessary but good for consistency
set ruler                          " shows line number in the status line
set switchbuf=useopen,usetab       " better behavior for the quickfix window and :sb
set tags=./tags;/,tags;/           " search tags files efficiently
set wildmenu                       " better command line completion, shows a list of matches
set tabstop=2                      " tabs to 4 
set shiftwidth=2                   " amount of spaces when multi-line tabbing with >>
set expandtab                      " hitting tab key will produce tabstop amount of spaces
set autoindent
set copyindent
set linebreak
set wildmenu
set laststatus=2                   " For Status line even with no split
set clipboard=unnamed              " Make it so copy/paste to system works from vim
set scrolloff=12                   " Start scrolling #n lines from top/bottom
set nu                             " Show line numbers 
set mouse=nicr                     " Enable mouse scroll
set showtabline=1
let mapleader=","                  " set leader to comma

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/cache/*,*/logs/*,*/web/*,*.svn/*

set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" Fix syntax highlighting
noremap <F12> <Esc>:syntax sync fromstart<CR>

" vim-sneak to act like easymotion
nmap s <Plug>Sneak_s
let g:sneak#streak = 1

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" python syntax highlighting
let python_highlight_all = 1
let python_version_2 = 1

let g:closetag_filenames = "*.html,*.xml,*.cfm,*.cfml,*.cfc,*.vue"

" UI customizations
set guifont=Hack:12
set background=dark
let g:rehash256 = 1
colorscheme molokai
set t_Co=256

"colorscheme gruvbox
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Navigation shortcuts
map <C-t> :TagbarToggle<CR>         " toggle tag bar
map <C-l> :bnext<CR>                " switch to next buffer
map <C-h> :bprevious<CR>            " switch to previous buffer

" SmoothScroll shortcuts
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
