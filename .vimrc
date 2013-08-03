set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'aklt/plantuml-syntax'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'camelcasemotion'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'eraserhd/vim-ios'
NeoBundle 'b4winckler/vim-objc'
NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build': {
    \    'unix'    : './install.sh --clang-completer',
    \    'mac'     : './install.sh --clang-completer',
    \ },
\ }

NeoBundle 'marijnh/tern_for_vim', {
    \ 'build': {
    \    'unix'   : 'npm install',
    \    'windows': 'npm install',
    \    'mac'    : 'npm install',
    \ },
\ }

NeoBundleCheck

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
set formatoptions-=r
set backspace=indent,eol,start

set columns=151

" persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

"color scheme
set t_Co=256
if &t_Co==256 || has("gui_runnig")
    colorscheme solarized
    set background=dark
endif

" Enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" NerdTREE
au VimEnter * NERDTree
au VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec      set filetype=ruby

" Jake
au BufNewFile,BufRead Jakefile set ft=javascript

" JsTestDirver config
au BufNewFile,BufRead jsTestDriver.conf set ft=yaml

" Key maps
map <C-L> <esc>:NERDTreeToggle<cr>
map <C-T> <esc>:TagbarToggle<cr>

" indentLine
let g:indentLine_color_gui = '#585858'
let g:indentLine_color_term = 239
" CoffeeTags
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
    \ }
endif

" markdown code highlight

let g:markdown_fenced_languages = [
    \ 'javascript',
    \ 'c',
    \ 'cpp',
    \ 'objective-c=objc'
\ ]
