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
if &t_Co==256 || has("gui_runnig")
    colorscheme solarized
    set background=dark
else
    colorscheme wombat256mod
endif

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

" Jake
au BufNewFile,BufRead Jakefile set ft=javascript

" JsTestDirver config
au BufNewFile,BufRead jsTestDriver.conf set ft=yaml

" Key maps
map <C-L> <esc>:NERDTreeToggle<cr>

