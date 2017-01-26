set nocompatible
filetype off

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set rtp+=~/.vim/bundle/Vundle.vim

"Plugins go between the #begin and #end, below.

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
Plugin 'nanotech/jellybeans.vim'
"Plugin 'rking/ag.vim'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'scrooloose/nerdtree'
Plugin 'benmills/vimux'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()

filetype plugin indent on
let g:jellybeans_overrides = {
\  'Cursor': { 'guibg': 'ff00ee', 'guifg': '00ff11' }
\}
colorscheme jellybeans

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
set tabstop=2

set hlsearch
set ttymouse=sgr

autocmd QuickFixCmdPost *grep* cwindow

set backup
set backupdir=~/.vimbkp
set dir=~/.vimswap

command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool
