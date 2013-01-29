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
set formatoptions-=r
set backspace=indent,eol,start

set columns=151

set t_Co=256
if &t_Co==256 || has("gui_runnig")
    colorscheme solarized
    set background=dark
else
    colorscheme wombat256mod
endif

let g:SuperTabDefaultCompletionType="context"

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_select = 1

" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Syntastic
let g:syntastic_check_on_open=1

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

