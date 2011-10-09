if exists('loaded_javascript_syntax_checker')
    finish
endif
let loaded_javascript_syntax_checker = 1

if !exists('g:Nodelint')
  let g:Nodelint = 'nodelint'
endif

if !exists('g:NodelintReporter')
  let g:NodelintReporter = $HOME.'/.vim/syntax_checkers/syntastic-reporter.js'
endif

function! SyntaxCheckers_javascript_GetLocList()
  let makeprg = g:Nodelint . ' ' . shellescape(expand("%")) . ' --reporter ' . g:NodelintReporter
  let errorformat = '%fline\ %l column\ %c Error: %m'
  return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction
