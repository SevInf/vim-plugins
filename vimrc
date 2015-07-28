set encoding=utf-8
scriptencoding utf-8
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.vim/bundle")

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'chriskempson/base16-vim'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'Raimondi/delimitMate'
Plug 'camelcasemotion'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'Shougo/unite.vim'
Plug 'SevInf/vim-bemhtml'
Plug 'mustache/vim-mustache-handlebars'
Plug 'airblade/vim-rooter'
Plug 'wting/rust.vim'
Plug 'janko-m/vim-test'
Plug 'mxw/vim-jsx'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'reedes/vim-pencil'

" Neovim-specific plugins
if has('nvim')
    Plug 'kassio/neoterm'
endif

call plug#end()

syntax on
filetype plugin on
filetype plugin indent on

set number
set relativenumber
set spell
set spelllang=en_us,ru_ru

set tabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab
set smartindent
set formatoptions-=r
set backspace=indent,eol,start

set columns=120

" persistent undo
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000

" show status line always
set laststatus=2

" don't show scrollbars, toolbar, menu
set guioptions+=rlTm
set guioptions-=rlTm

"color scheme
set t_Co=256
colorscheme base16-solarized
set background=dark

"enable mouse
set mouse=a


" define a group for autocommands
augroup vimrc
    autocmd!
    " Enable omni completion
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Tabstop 2 for some files
    autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
    autocmd FileType json setlocal tabstop=2 shiftwidth=2
    autocmd FileType coffee setlocal tabstop=2 shiftwidth=2
    autocmd FileType jade setlocal tabstop=2 shiftwidth=2
    autocmd FileType ruby setlocal tabstop=2 shiftwidth=2

    " jshint
    autocmd BufNewFile,BufRead .jshintrc set ft=json

    " bower
    autocmd BufNewFile,BufRead .bowerrc set ft=json

    " CocoaPods
    autocmd BufNewFile,BufRead Podfile,*.podspec      set filetype=ruby

    " Auto hard wrap markdown to 80 chars
    autocmd FileType markdown call pencil#init({'wrap': 'hard'})
augroup END

" Key maps
let g:mapleader=","
noremap <leader>f <esc>:Unite -start-insert file_rec/async<cr>
nnoremap <leader>b <esc>:Unite -start-insert buffer<cr>
noremap <leader>u <esc>:Unite -start-insert source<cr>
noremap <leader>g <esc>:Unite grep<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>t :TagbarToggle<cr>
noremap <C-Left> <esc>:tabprevious<cr>
noremap <C-h> <esc>:tabprevious<cr>
noremap <C-Right> <esc>:tabnext<cr>
noremap <C-l> <esc>:tabnext<cr>
nnoremap H ^
nnoremap L $
nnoremap Q <nop>

" Hard mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Abbriviations
iabbrev filed field
iabbrev Filed Field

" indentLine
let g:indentLine_color_gui = '#585858'
let g:indentLine_color_term = 239
let g:indentLine_char = '┊'

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

" airline
let g:airline#extensions#tagbar#enabled = 0
let g:airline_exclude_preview = 0

" syntastic
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jshint', 'jscs']

" no-conceal cursor for indent line
let g:indentLine_noConcealCursor=""

" no conceal for json
let g:vim_json_syntax_conceal = 0

" Vim test mapping
nmap tn :TestNearest<CR>
nmap tt :TestLast<CR>

" Text Width for pencil
let g:pencil#textwidth = 80

" NERDTree
let g:NERDTreeQuitOnOpen = 1

" Vim rooter
let g:rooter_use_lcd = 1

" Neovim-specific settings
if has('nvim')
    augroup nvimrc
        autocmd!
        autocmd WinEnter term://* startinsert
    augroup END

    let test#strategy = "neoterm"
    let g:neoterm_position = 'vertical'
endif
