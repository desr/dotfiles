" Required for Vundle
set nocompatible
filetype off

" Automatic Vundle install. 
let vundle_installed=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle..."
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let vundle_installed=0
endif

" Add Vundle to runtime path and initialise. 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let Vundle manage itself, required.
Plugin 'VundleVim/Vundle.vim'

" Plugin list.
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'pangloss/vim-javascript'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

" Snipmate plugin and dependencies. 
" TODO: Replace with ultisnips and youcompleteme:
" https://medium.com/brigade-engineering/sharpen-your-vim-with-snippets-767b693886db
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

" Required
call vundle#end()
filetype plugin indent on

" Install plugins. 
if vundle_installed == 0
	echo "Installing bundles..."
	:PluginInstall
endif

" =======
" General
" =======

" Reduce mode change timeout. 
set timeoutlen=1000 ttimeoutlen=50

" Respect mode lines. 
set modeline

" Use expected backspace behavior. 
set backspace=indent,eol,start

" Maintain selection when indenting. 
vnoremap < <gv
vnoremap > >gv

" Turn off swap files and backups. 
set nobackup
set noswapfile
set nowritebackup

" Allow buffer switching without disk writes. 
set hidden

" Store extra history. 
set history=1000
set undolevels=1000

" Command completion. 
set wildmode=list:longest
set wildmenu
set wildignore+=*.o,*.obj,*.pyc,*.~
set wildignore+=*.png,*.jpg,*.gif,*.ico

" Disable beeps. 
set visualbell
set noerrorbells

" -------
" Display
" -------

" Change terminal title. 
set title

" Tabs are 4 spaces. 
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Turn on incremental search highlighting. 
set hlsearch
set incsearch

" Abbreviate messages and disable splash screen. 
set shortmess=atI

" Use filetype-specific plugins and indentation. 
set nosmartindent
filetype plugin indent on

" Show status line for single windows.
set laststatus=2

" Scrolling offests. 
set scrolloff=8

" -------
" Colours
" -------

syntax enable
set background=dark
colorscheme solarized
let g:airline_theme="sol"
let g:airline_powerline_fonts=1

" ----
" Keys
" ----

" Use comma as leader. 
let mapleader=','

" Clear search highlight. 
nmap <Leader>n <Esc>:noh<CR>

" Window navigation shortcut. 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Command shortcut. 
nnoremap ; :


" ------
" Pymode
" ------

" Disable pymode linting. 
let g:pymode_run=0
let g:pymode_lint=0
let g:pymode_folding=0

" Enable rope lookups. 
"let g:pymode_rope_goto_def_newwin="vnew"
"map <Leader>g :call RopeGotoDefinition()<CR>

" ---------
" Syntastic
" ---------

" Check files on open. 
let g:syntastic_check_on_open=1

" Always reload location list on syntastic check. 
let g:syntastic_always_populate_loc_list=1

" Use flake8 and pep8 with Python files. 
let g:syntastic_python_checkers=['flake8', 'pep8']

" Javascript linters. 
let g:syntastic_javascript_checkers=['jshint']


" ------
" Python
" ------
autocmd FileType python highlight Excess ctermbg=Black
autocmd FileType python match Excess /\%80v.*/
autocmd FileType python set nowrap
autocmd FileType python set number
autocmd FileType python set expandtab

" ----
" HTML
" ----
autocmd FileType html set shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html set textwidth=0

" -
" C
" -
autocmd FileType c set number
autocmd FileType c set number

" ---
" PHP
" ---
autocmd FileType php set number
