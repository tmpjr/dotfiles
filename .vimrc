set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins loaded by vundle
" :PluginInstall
Plugin 'gmarik/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-fugitive'
Plugin 'evidens/vim-twig'
Plugin 'chriskempson/base16-vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'fatih/vim-go'
Plugin 'hdima/python-syntax'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'justinmk/vim-sneak'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'jelera/vim-javascript-syntax'
" Auto-compolete - must be compiled
" from within ~/.vim/bundle/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" Snips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()                  " required

filetype plugin indent on          " filetype detection and settings
syntax on                          " syntax highlighting
set backspace=indent,eol,start     " let the backspace key work normally
set hidden                         " hide unsaved buffers
set incsearch                      " incremental search rules
set laststatus=2                   " not strictly necessary but good for consistency
set ruler                          " shows line number in the status line
set switchbuf=useopen,usetab       " better behavior for the quickfix window and :sb
set tags=./tags;/,tags;/           " search tags files efficiently
set wildmenu                       " better command line completion, shows a list of matches
set nonu                           " toggle line numbers
set tabstop=4                      " tabs to 4 
set shiftwidth=4                   " amount of spaces when multi-line tabbing with >>
set expandtab                      " hitting tab key will produce tabstop amount of spaces
set laststatus=2                   " For Status line even with no split
set clipboard=unnamed              " Make it so copy/paste to system works from vim
set scrolloff=12                   " Start scrolling #n lines from top/bottom
set nu                             " Show line numbers 
set mouse=nicr                   " Enable mouse scroll

let mapleader=","                  " set leader to comma

"Unite.vim settings
"call unite#custom#source('file_rec/async', 'ignore_pattern', 'node_modules/\|bower_components/\|app/cache/\|app/logs/')
"nnoremap <C-p> :Unite file_rec/async<cr>
"nnoremap <space>/ :Unite grep:.<cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/cache/*,*/logs/*,*/web/*
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = { "type": "style"  }

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" vim-sneak to act like easymotion
nmap s <Plug>Sneak_s
let g:sneak#streak = 1

"let g:jsx_ext_required = 0 " Allow JSX in normal JS files"
let g:javascript_enable_domhtmlcss = 1

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" python syntax highlighting
let python_highlight_all = 1


" UI customizations
"let base16colorspace=256
set t_Co=256
set background=dark
let g:PaperColor_Dark_Override = { 'background' : '#3f3f3f', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f'  }
colorscheme PaperColor

let g:airline_theme = "PaperColor"
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
"highlight Comment cterm=italic

" Navigation shortcuts
map <C-t> :TagbarToggle<CR>         " toggle tag bar
map <C-l> :bnext<CR>                " switch to next buffer
map <C-h> :bprevious<CR>            " switch to previous buffer
