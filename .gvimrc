" always have syntax highlighting in with the gui:
syntax on

"display line numbers
set number
" window size:
set lines=40
" Use 4 spaces to ident
set shiftwidth=4


" have error messages red on white (rather than t'tother way round, which isn't
" readable in the above font):
highlight ErrorMsg guibg=White guifg=Red

" tabs
set stal=2

" my color scheme
colorscheme twilight

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

" save file with C-S
:imap <C-s> <ESC>:w<CR>a
:map <C-s> :w<CR>

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

"enable FTP passive mode
"let g:netrw_ftp_cmd="ftp -p"
"let g:netrw_ftp_cmd = 'ftp -p'

"backup
set backupdir=/tmp/
set bdir=/tmp/

"sessions
set sessionoptions=blank,buffers,curdir,globals,options,localoptions,slash,folds,resize,tabpages,winsize,winpos,unix

" A command for setting the session name
"com -nargs=1 SetSession :let g:SessionFileName = g:PathToSessions . "/" . "<args>" . ".vim"
" .. and a command to unset it
"com -nargs=0 UnsetSession :let g:SessionFileName = ""

set shortmess+=A

" highlight current line when in insert more
autocmd InsertEnter * se cul
autocmd InsertLeave * se nocul

" enable all highlight options
let python_highlight_all = 1

" always use current path to file in explorer
autocmd BufEnter * lcd %:p:h

au BufWriteCmd *.py call CheckPythonSyntax()

function CheckPythonSyntax()
  redraw!
  set lazyredraw
  cclose
  let l:curfile = bufname("%")
  let l:tmpfile = tempname()
  silent execute "write! ".tmpfile

  " check pyflakes
  setlocal errorformat=%f:%l:%m
  let output = system("pyflakes ".l:tmpfile)
  cexpr substitute(output, fnameescape(tmpfile), fnameescape(curfile), "g")

  " check pep8 and ignore too long lines
  setlocal errorformat=%f:%l:%c:%m
  let output = system("pep8 --ignore E501 --repeat ".l:tmpfile)
  caddexpr substitute(output, fnameescape(tmpfile), fnameescape(curfile), "g")

  " cleanup
  call delete(l:tmpfile)

  if getqflist() == []
      write
  else
      write
      belowright copen
      nnoremap <buffer> <silent> c :cclose<CR>
  endif
  set nolazyredraw
  redraw!
endfunction

