" vim: set fenc=utf-8 tw=80 sw=2 sts=2 et foldmethod=marker :

" use pathogen
call pathogen#infect()

scriptencoding utf-8
colorscheme twilight
filetype plugin on
filetype indent on
syntax on
set number

" swapfile
set directory=~/tmp,/tmp,.,/var/tmp " set paths for swapfile

" autocompletion options
" tags for python libs
"set tags+=~/.vim/tags/python.ctags
autocmd FileType python,mako set omnifunc=pythoncomplete#Complete
"autocmd FileType python set omnifunc=pysmell#Complete
"autocmd FileType html,mako set omnifunc=htmlcomplete#Complete
"autocmd FileType html,mako set omnifunc=htmlcomplete#CompleteTags
"
autocmd FileType mako set filetype=mako.html.js
autocmd FileType rst set spell
autocmd BufRead *.less set filetype=less
autocmd BufRead,BufNewFile *.zcml :set ft=xml
autocmd BufRead,BufNewFile *.jinja :set ft=htmljinja
autocmd BufRead,BufNewFile *.jinja2 :set ft=htmljinja
"|set expandtab 
autocmd FileType xhtml,html set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab autoindent

" remap omnicompletion
inoremap <Nul> <C-x><C-o>

" hide .pcy files
let g:explHideFiles='^\.,.*\.pyc$' 

" bind fuzzyfinder to Ctrl-o
map <C-O> :FufCoverageFile<CR>

" 265 colors in terminal
set t_Co=256

" nerdtree ignore pyc
let NERDTreeIgnore=['\.pyc$']

" ropevim
let ropevim_vim_completion=1
let ropevim_extended_complete=1

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
"let g:syntastic_auto_loc_list=1

" detectindent
:let g:detectindent_preferred_expandtab = 1 
:let g:detectindent_preferred_indent = 4
:autocmd BufReadPost * :DetectIndent

" ropevim
let g:ropevim_vim_completion=1
let g:ropevim_extended_complete=1
