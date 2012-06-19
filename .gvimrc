" window size:
set lines=40

" have error messages red on white (rather than other way round, which isn't
" readable in the above font):
highlight ErrorMsg guibg=White guifg=Red

" tabs
set stal=2

" no menu, no scrollbar and no toolbar:
set guioptions-=m
set guioptions-=T
set guioptions-=r

"display only file name in tabs
set guitablabel=%t

" tab navigation like firefox
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:map <C-S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>
:imap <C-tab> <ESC>:tabnext<cr>i
:nmap <C-w> :tabclose<cr>
:imap <C-w> <ESC>:tabclose<cr>

" on/off search hl
map <F3> :set hlsearch!<CR>
imap <F3> <ESC>:set hlsearch!<CR>a

" use ljust
"vmap <F5> !ljust<CR>

" search as you type
set incsearch

"utf-8 encoding
:set nobomb
:set fileencodings=utf-8
:set encoding=utf-8

"set number of file history
set history=50

"backup
set backupdir=/tmp/
set bdir=/tmp/

"sessions
set sessionoptions=blank,buffers,curdir,globals,options,localoptions,slash,folds,resize,tabpages,winsize,winpos,unix

set shortmess+=A

" highlight current line when in insert more
autocmd InsertEnter * se cul
autocmd InsertLeave * se nocul

" enable all highlight options
let python_highlight_all = 1

" always use current path to file in explorer
autocmd BufEnter * lcd %:p:h
