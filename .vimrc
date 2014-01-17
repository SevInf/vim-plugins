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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'alunny/pegjs-vim'
NeoBundle 'SevInf/vim-bemhtml'

NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build': {
    \    'unix'    : 'sh install.sh --clang-completer --system-libclang',
    \    'mac'     : 'sh install.sh --clang-completer --system-libclang',
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
set relativenumber
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
noremap <leader>f <esc>:Unite -start-insert file_rec/async<cr>
noremap <leader>b <esc>:Unite -start-insert buffer<cr>
noremap <leader>u <esc>:Unite -start-insert source<cr>
noremap <leader>g <esc>:Unite grep<cr>
noremap <C-T> <esc>:TagbarToggle<cr>
noremap <C-Left> <esc>:tabprevious<cr>
noremap <C-h> <esc>:tabprevious<cr>
noremap <C-Right> <esc>:tabnext<cr>
noremap <C-l> <esc>:tabnext<cr>

" neobundle
let g:neobundle#install_process_timeout = 180

" indentLine
let g:indentLine_color_gui = '#585858'
let g:indentLine_color_term = 239
let g:indentLine_char = '┊'
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
    \ 'js=javascript',
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
let g:airline_exclude_preview = 0

" vimshell
let g:vimshell_environment_term='xterm-256color'
