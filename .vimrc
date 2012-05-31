call pathogen#infect()
call pathogen#helptags()

set nocompatible

syntax on
filetype plugin on
filetype plugin indent on

set number
set spell

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set columns=151

set t_Co=256
colorscheme wombat256mod

let g:SuperTabDefaultCompletionType="context"

" NerdTREE
au VimEnter * NERDTree
au VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec      set filetype=ruby

" MXML and ActionScript
au BufNewFile,BufRead *.mxml set ft=mxml
au BufNewFile,BufRead *.as set ft=actionscript

" Key maps
map <C-L> <esc>:NERDTreeToggle<cr>

