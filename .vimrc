" PLUGINS ----------------------------------------------------------------------------------------------------------------------------------------------------------{{{

" Plugin code goes here.




" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

"Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on




" Turn syntax highlighting on.
syntax on




" Add numbers to each line of the left-hand side.
set number




"Highlight cursor Line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn




" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

"Use space characters instead of tabs.
set expandtab

" Do not save backupfiles
" set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
" set nowrap

" While searching through a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search
set ignorecase

" Override the ignore case option if searching for capital letters. This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search
set hlsearch

" Set the commands to save in history deafult number is 20.
set history=1000




" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completetion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx




call plug#begin('~/.vim/plugged')




call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------------------------------------------------------------------------------------------------- {{{

" Mapping code goes here.

" }}}

" VIMSCRIPT -------------------------------------------------------------------------------------------------------------------------------------------------------- {{{

" This will enable code folding. User the marker method of folding.
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END




" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equl to or greater than 7.3 enable undofile. This allows
" you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into section by typing `:split` or `:vsplit`. Display
" cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    " autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running et these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme molokai

    " Set a custom font you have installed on your computer. Syntax: set
    " guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default. Hide the toolbar.
    set guioptions-=T

    " Hide the left-side scroll bar.
    set guioptions-=L

    " Hide the right-side scroll bar.
    set guioptions-=r

    " Hide the menu bar.
    set guioptions-=m

    " Hide the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar. <Bar> is the
    " pipe character. <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>
endif

" More Vimscripts code goes here.

" }}}

" STATUS LINE ------------------------------------------------------------------------------------------------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
