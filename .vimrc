" vim: set fenc=utf-8 tw=80 sw=2 sts=2 et foldmethod=marker :

" use pathogen
call pathogen#infect()

scriptencoding utf-8
colorscheme twilight
filetype plugin on
filetype indent on
syntax on
set number

" visally display tabs
set lcs=tab:>-
set list!
set tabstop=3

" swapfile
set directory=~/tmp,/tmp,.,/var/tmp " set paths for swapfile

autocmd BufRead,BufNewFile *.mako set ft=mako
autocmd BufRead,BufNewFile *.less set ft=less
autocmd BufRead,BufNewFile *.zcml :set ft=xml
autocmd BufRead,BufNewFile *.jinja :set ft=jinja
autocmd BufRead,BufNewFile *.jinja2 :set ft=jinja
autocmd BufRead,BufNewFile *.aug :set ft=augeas
autocmd FileType python,mako set omnifunc=pythoncomplete#Complete
autocmd FileType rst set spell
autocmd FileType xhtml,html set noexpandtab
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

" statusline
set laststatus=2
