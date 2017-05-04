set nocompatible
filetype off

let g:TerminusCursorShape=0

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set rtp+=~/.vim/bundle/Vundle.vim

"Plugins go between the #begin and #end, below.

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'scrooloose/nerdtree'
Plugin 'benmills/vimux'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/guicolorscheme.vim'
Plugin 'vim-scripts/vim-indent-object'
Plugin 'vim-scripts/jslint.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-latex/vim-latex'
Plugin 'xolox/vim-notes'
Plugin 'vim-scripts/netrw.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'xolox/vim-misc'
Plugin 'trammell/subscripts.vim'
Plugin 'iitaku/clewn-mirror'
Plugin 'wincent/terminus'
Plugin 'inkarkat/SmartCase'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mtscout6/vim-cjsx'
Plugin 'Chiel92/vim-autoformat'
Plugin 'triglav/vim-visual-increment'
Plugin 'haya14busa/git-mergetool-vimdiff-wrapper'
call vundle#end()

filetype plugin indent on
let g:jellybeans_overrides = {
\  'Cursor': { 'guibg': 'ff00ee', 'guifg': '00ff11' }
\}
colorscheme jellybeans
:let g:notes_directories = ['~/Notes']

let mapleader="\\"
set mouse=a
set ttyfast

set ttymouse=xterm

autocmd BufWritePre * %s/\s\+$//e

set hidden

syntax enable


let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceUseTabline = 1

set number

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4


set hlsearch
set ttymouse=sgr

autocmd QuickFixCmdPost *grep* cwindow

set backup
set backupdir=~/.vimbkp
set dir=~/.vimswap

command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

colorscheme desert

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap <silent> <A-h> :tabp<CR>
nmap <silent> <A-l> :tabn<CR>
""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.{py,coffee,c,h,cpp,java} :call DeleteTrailingWS()

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

let g:ctrlspace_use_tabline=1
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set nrformats=alpha,hex
