" ------------------------------------------------------------ VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle setup
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-commentary'
Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/mru.vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'othree/html5-syntax.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'Raimondi/delimitMate'
Plugin 'cendaeg/NerdIgnore'
Plugin 'Valloric/YouCompleteMe'
Plugin 'isRuslan/vim-es6'
Plugin 'sjbach/lusty'

" All plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ------------------------------------------------------------ LOOKS
set t_Co=256                          " 256 color range
set background=dark                   " dark background
colorscheme Tomorrow-Night-eighties   " nice colorscheme
syntax enable					                " enable syntax processing
highlight VertSplit ctermbg=NONE      " hide color of vim split bar
set cursorline                        " highlight current line


" ------------------------------------------------------------ LEADER
let mapleader="\<Space>"              " leader is <space>

nmap <Leader><Leader> V               " enter visual mode with <space><space>
nnoremap <leader>a :Ag                " open up Silver Searcher with <space>a
""""" RELOAD VIMRC WITH <space>sv
:nnoremap <leader>sv :source $MYVIMRC<cr>
"""""
nnoremap <Leader>w :w<CR>             " save with <space>w
noremap <leader>W :w !sudo tee %<CR>  " sudo write with <space>W
nnoremap <Leader><CR> o<Esc>          " insert line with <space>Enter
imap <C-c> <CR><Esc>O                 " insert line in insert mode with <ctrl>c
nnoremap <Leader>h :noh<CR>           " unhighlight everything
""""" Buffer navigation (<Space>,) (<Space>]) (<Space>[) (<space>ls)
map <leader>, <C-^>
map <leader>] :bnext<CR>
map <leader>[ :bprev<CR>
map <leader>ls :buffers<CR>
"""""
" ------------------------------------------------------------ INDENTATION
set tabstop=2				                  " two spaces per tab
filetype indent on                    " load filetype-specific indents
set expandtab                         " tabs are spaces
set shiftwidth=2                      " set indentation columns
set softtabstop=2                     " number of columns in insert mode
set smartindent                       " indent files smartly
filetype indent on                    " set indentation by filetype

" ------------------------------------------------------------ BEHAVIOR
set relativenumber                    " make line numbers relative
set nu                                " show line numbers
set backspace=indent,eol,start        " fix backspace behavior
set laststatus=2                      " Always show status line
set magic                             " enable extended regexes.
set noerrorbells                      " disable annoying error bells
set visualbell                        " disable use visual bells
set ofu=syntaxcomplete#Complete       " Set omni-completion method.
set ttyfast                           " more keys/sec == 1337 H4X0R
set title                             " filename in the window titlebar
vmap v <Plug>(expand_region_expand)   " use v to expand select region
vmap <C-v> <Plug>(expand_region_shrink) " use ctrl-v to shrink select region
set shortmess=atI                     " no stupid intro message
set showmode                          " Show the current mode.
set showtabline=2                     " Always show tab bar.
set lazyredraw                        " Don't redraw all the time
set showmatch                         " highlight matching [{}]
""""" Spellcheck all files
"""""

" ----------------------------------------- DISABLED
"set mouse=a                           " Enable mouse in all in all modes.
" ^ not set to stop my n00b3ry


" ------------------------------------------------------------ SEARCH
set incsearch                         " search as characters are typed
set hlsearch                          " highlight matches
set ignorecase                        " ignore case of searches
set gdefault                          " default to global search
set smartcase                         " ignore ignore case if uppercase letters
set wrapscan                          " Searches wrap around end of file

" ------------------------------------------------------------ WILDMENU
set wildmenu                          " use wildmenu
set wildchar=<TAB>                    " tab complete commands
""""" IGNORE CERTAIN EXTENSION IN WILDMENU
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
"""""
set wildmode=list:longest             " Complete only until point of ambiguity.
set winminheight=0                    " splits reduced to single line.

" ------------------------------------------------------------ HISTORY
set hidden                            " remember buffer history
set history=1000                      " increase history from 20 to 1000

" ------------------------------------------------------------ UNDO/SWAP/BACKUP
set undofile                          " persistent undo
set backupdir=~/.vim/backups          " use global backup directory
set directory=~/.vim/swaps            " use global swaps directory
set undodir=~/.vim/undo               " use global undo directory

" ------------------------------------------------------------ BUFFERS
nnoremap <leader>bc :Bclose

" ------------------------------------------------------------ MOVEMENT
nnoremap <C-e> 3<C-e>                 " speed up viewport scrolling
nnoremap <C-y> 3<C-y>                 " speed up viewport scrolling
""""" EASYMOTION PREFIX <space>e
nmap <Leader>e <Plug>(easymotion-prefix)
"""""

" ------------------------------------------------------------ COPY/PASTE
""""" LEADER COPY/CUT/PASTE COMMMANDS
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
"""""

" ------------------------------------------------------------ REMAPS
nnoremap J mjJ`j                      " J to join lines
vmap <Leader>sc setlocal spell        " <space>sc to spellcheck

" ------------------------------------------------------------ CTRLP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 2     " smart path mode
let g:ctrlp_mru_files = 1             " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2        " Jump to tab AND buffer if already open
""""" USE AG FOR
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"""""
let g:ctrlp_split_window = 1          " <CR> = New Tab

" ------------------------------------------------------------ SYNTASTIC
let g:syntastic_check_on_open=1       "check syntax on open
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["eslint"]
" ------------------------------------------------------------ NERDTREE
autocmd vimenter * NERDTree         " use nerdtree on open
autocmd VimEnter * wincmd p         "
noremap <C-\> :NERDTreeToggle<CR>         " use ctrl-\ to open nerdtree
autocmd StdinReadPre * let s:std_in=1 "
"""""
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"""""
let g:NERDTreeWinPos = "right"        " set nerdtree to right side


" ------------------------------------------------------------ Extra Functions
vmap \em :call ExtractMethod()<CR>
function! ExtractMethod() range
  let name = inputdialog("Name of new method:")
  let args = inputdialog("Args. of new method:")
  "Get selected text
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  let code = join(lines, "\n")
  exe "normal! }ofunction ". name ."(". args .") {\<ESC>=="
  exe "normal! o". code ."\<ESC>=="
  exe "normal! o}\<ESC>"
endfunction
