" vim: set fenc=utf-8 tw=80 sw=2 sts=2 et foldmethod=marker :
scriptencoding utf-8
colorscheme twilight
filetype plugin on
filetype indent on

" swapfile
set directory=~/tmp,/tmp,.,/var/tmp " set paths for swapfile

" tags for python libs
set tags+=~/.vim/tags/python.ctags

autocmd FileType python,mako set omnifunc=pythoncomplete#Complete
"autocmd FileType python set omnifunc=pysmell#Complete
"autocmd FileType html,mako set omnifunc=htmlcomplete#Complete
"autocmd FileType html,mako set omnifunc=htmlcomplete#CompleteTags
autocmd FileType mako set filetype=mako.html.js
autocmd FileType rst set spell
autocmd BufRead *.less set filetype=less
autocmd BufRead,BufNewFile *.zcml :set ft=xml
autocmd BufRead,BufNewFile *.jinja :set ft=jinja
autocmd FileType * set tabstop=4|set shiftwidth=4
"|set expandtab 
autocmd FileType xhtml,html set tabstop=2|set shiftwidth=2|set noexpandtab

" remap omnicompletion
inoremap <Nul> <C-x><C-o>

" hide .pcy files
let g:explHideFiles='^\.,.*\.pyc$' 

" map help to F2
map <F2> :exec "!xterm -e 'pydoc ".expand("<cword>")."'"<CR><CR>
imap <F2> <ESC>:exec "!xterm -e 'pydoc ".expand("<cword>")."'"<CR><CR>i

" map the paster.pocco.org
map <C-P> :Lodgeit<CR>

" bind fuzzyfinder to Ctrl-o
map <C-O> :FufCoverageFile<CR>

" 265 colors in terminal
set t_Co=256

" nerdtree ignore pyc
let NERDTreeIgnore=['\.pyc$']

" configure SuperTab
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabLongestHighlight = 1

" ropevim
let ropevim_vim_completion=1
let ropevim_extended_complete=1

" remap arrows
map <Up> gk
map <Down> gj
imap <Up> <ESC>gki
imap <Down> <ESC>gji

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1

" detectindent
:let g:detectindent_preferred_expandtab = 1 
:let g:detectindent_preferred_indent = 4
:autocmd BufReadPost * :DetectIndent
