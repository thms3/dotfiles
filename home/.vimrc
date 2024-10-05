"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:
"     This is the .vimrc file.
"
" Maintainer:
"       Thomas Neff
"
" Acknowledgments:
"       Several elements of this .vimrc come from Jules Aubert's config
"       https://github.com/Gelules/dotfiles/blob/master/vim/.vimrc
"       Extra credits Kévin "Chewie" Sztern's config
"       https://github.com/Chewie/configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if we don't already have it
" Credit to github.com/captbaritone
" Extra credit to Kévin "Chewie" Sztern
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Bag of mappings
Plug 'tpope/vim-unimpaired'

" Theming
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline'
Plug 'luochen1990/rainbow'

" Tag's managment
Plug 'ludovicchabant/vim-gutentags'

" File systeme explorer tree
Plug 'preservim/nerdtree'

" Git features
Plug 'tpope/vim-fugitive'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General parameters
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Recognize file types by extension
filetype on

" Enable filetype detection for plugins and indentation options
filetype plugin indent on

" Reload a file when it is changed from the outside
set autoread

" Write the file when we leave the buffer
set autowrite

" Disable backups, we have source control for that
set nobackup

" Force encoding to utf-8 (for systems where is not the default encoding)
set encoding=utf-8

" Disable swapfiles too
set noswapfile

" Hide buffers instead of closing them
set hidden

" Set the time (in milliseconds) spent idle until various actions occur
" In this configuration, it is particularly useful for the tagbar plugin
set updatetime=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jellybeans plugin -->"
" Choose your favorite colorscheme, feel free to switch to another colorscheme !
colorscheme jellybeans

" Use a slightly darker background color to differentiate with the status line
let g:jellybeans_background_color_256='NONE'
" <-- Jellybeans plugin"

" Make backspaces behave as expected
set backspace=eol,indent,start

" Display whitespaces characters
set list
set listchars=eol:¬,tab:>-,trail:\ ,nbsp:¤

set fillchars=vert:│

" Enhance command line completion
set wildmenu

" Set completion behavior, see :help wildmode for details
set wildmode=longest:full,list:full

" Show current mode
set showmode

" Show the command being executed
set showcmd

" Show line number
set number

" Always show satus line
set laststatus=2

" Format the status line
" This status line comes from Pierre Bourdon's vimrc
" set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)
set statusline+=%{gutentags#statusline()}

" Enable syntax highlighting
syntax on

" Allow mouse use in vim
set mouse=a

" Disable bell completely
set visualbell
set t_vb=

" Briefly show matching braces, parens, etc
set showmatch

" Enable line wrapping
set wrap

" Wrap on column 80
set textwidth=80

" Color the column after textwidth, usually the 80th
set colorcolumn=+1

" Highlight colorcolumn
hi ColorColumn ctermbg=Black guibg=Black

" Highlight current line
set cursorline

" Select both part on the line (below and above the line number)
set cursorlineopt=both

" Define the color's cursor line (before and after the line number)
hi CursorLine ctermbg=Black cterm=none term=none guibg=Black
hi CursorLineNr ctermbg=Black  cterm=none guibg=Black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move te cursor to the matched string
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentations options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The length of a tab
" This is for documentation purposes only,
" do not change the default value of 8, ever.
set tabstop=8

" The spaces number inserted when usig < or >
set shiftwidth=4

" The spaces numer inserted when you press tab.
" -1 means the same values is shiftwidth
set softtabstop=-1

" Insert spaces instead of tabs
set expandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent

" See :help cinotptions for details
set cinoptions=(O,uO,UO,tO,gO,N-s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bracket options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-unimpaired plugin -->"
" Override unimpaired quickfix and loc-list mappings to use vim-qf wrapparound
let g:nremap = {"[q": "", "]q": "", "[l": "", "]l": ""}
nmap [q <Plug>(qf_qf_previous)
nmap ]q <Plug>(qf_qf_next)
nmap [l <Plug>(qf_loc_previous)
nmap ]l <Plug>(qf_loc_next)
" <-- vim-unimpaired plugin"

" Rainbow plugin -->"
" Rainbow parentheses
let g:rainbow_active = 1
" <-- Rainbow plugin"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands and mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" To find command easier
set nocp

" Set "," as map leader
let mapleader = ","

" Insert a newline without entering in insert mode
noremap oo o<Esc>k
noremap OO O<Esc>j

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" Move between rows in wrapped lines
noremap j gj
noremap k gk

" Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" Use the clipboards of vim and external environment
set clipboard+=unnamedplus

" Paste from a external environment source or from vim
set paste

" Visual selection automatically copied to the clipboard
set go+=a

" Open the quickfix window if there are errors, or close it if there are no
" errors left
noremap <leader>cw :botright :cw<cr>

" Add the termdebug built-in package
packadd termdebug

" Run make silently, then skip the 'Press ENTER to continue'
noremap <leader>m :silent! :make! \| :redraw!<cr>

" Running python code with <F5> shorcut
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Copy from vim workspace to clopboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" Paste from vim workspace to clipboard
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set location of the viminfo file
set viminfo='20,\"50,<100,n~/.vimtmp/viminfo

" See :h last-position-jump
augroup last_position_jump
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Persistent undo
set undofile
set undodir=~/.vimtmp/undo
silent !mkdir -p ~/.vimtmp/undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax normalization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Command NormRCfileto norm rcfile
command! NormRCFile call NormRCFile()

function! NormRCFile()
    " Replace multiple consecutive line breaks with a single line break
    %!cat -s

    " Remove trailing spaces
    %s/\s\+$//e
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin mappings and options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree plugin -->"
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" <-- NERDTree plugin
