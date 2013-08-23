set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'aklt/plantuml-syntax'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-ruby/vim-ruby'
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
NeoBundle 'leshill/vim-json'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

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
set paste

set columns=151

" persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" show status line always
set laststatus=2

" don't show scrollbars, toolbar, menu
set guioptions+=rlTm
set guioptions-=rlTm

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

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec      set filetype=ruby

" Jake
au BufNewFile,BufRead Jakefile set ft=javascript

" JsTestDirver config
au BufNewFile,BufRead jsTestDriver.conf set ft=yaml

" Key maps
"map <C-L> <esc>:NERDTreeToggle<cr>
map <leader>f <esc>:Unite -start-insert file_rec/async<cr>
map <leader>b <esc>:Unite -start-insert buffer<cr>
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

" YCM keys
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_select_previous_completion = ['<Up>']

" Ultisnpips keys
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-tab>'

" buferline
let g:bufferline_echo = 0

" airline
let g:airline#extensions#tagbar#enabled = 0
