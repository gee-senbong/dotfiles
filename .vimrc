" Vundle related settings
set nocompatible          " Disable vi-compability
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Add list of vim plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on
syntax on
colorscheme desert

" Vim settings
set number                " Display line number
set tabstop=4             " A tab is 4 spaces
set softtabstop=4         " When hitting <BS>, pretend like a tab is removed
set shiftwidth=4          " Number of spaces to use for autoindent
set smarttab              " A tab in an indent inserts 'shiftwidth' spaces
set expandtab             " Expand tab to spaces in insert mode
set colorcolumn=80        " Highlight 81th columns
set hlsearch              " Highlight search matches
set incsearch             " Shows search matches as you type
set smartcase             " If caps, watch case
set ignorecase            " If all lowercase, ignore case

" Enable backup file option
set backup
if &backupdir =~# '^\.,'
    set backupdir=~/.vim/tmp/backup
    set backupskip=/tmp/*
endif

" Enable swap file option
set swapfile
if &directory =~# '^\.,'
    set directory=~/.vim/tmp/swap
endif

" Enable undo file option
set undofile
if &undodir =~# '^\.\%(,\|$\)'
    set undodir=~/.vim/tmp/undo
endif

" Set leader key
let mapleader=","

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Clear search
nnoremap <silent><C-L> :nohlsearch<CR>

" Show tab, end of line & carriage return characters
noremap <leader>l :set list! listchars=tab:→-,eol:¬<CR>

" File type specific configuration
augroup Web
    autocmd!
    autocmd Filetype css,javascript,html,xml setlocal shiftwidth=2
    autocmd Filetype css,javascript,html,xml setlocal softtabstop=2
    autocmd Filetype css,javascript,html,xml setlocal tabstop=2
augroup END

augroup Text
    autocmd!
    autocmd Filetype markdown,text setlocal colorcolumn=0
augroup END

" Tab Autocomplete
function! InsertTabWrapper()
    " MULTIPURPOSE TAB KEY
    " Indent if we're at the beginning of a line. Else, do completion.
    " via https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
inoremap <S-TAB> <C-N>
