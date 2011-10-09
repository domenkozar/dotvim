if !exists('loaded_snippet') || &cp
    finish
endif

function! PyInit(text)
    if a:text != "args"
        return ', '.a:text
    else
        return ''
    endif
endfunction

function! PyRemDefVal(text)
    return substitute(a:text,'=.*','','g')
endfunction

function! PyInitVars(text)
    if a:text != "args"
        let text = substitute(a:text,'=.\{-},','','g')
        let text = substitute(text,'=.\{-}$','','g')
        let text = substitute(text,',','','g')
        let ret = ''
        let tabs = indent(".")/&tabstop
        let tab_text = ''
        for i in range(tabs)
            let tab_text = tab_text.'\t'
        endfor
        for Arg in split(text, ' ')
            let ret = ret.'self.'.Arg.' = '.Arg.'\n'.tab_text
        endfor
        return ret
    else
        return "pass"
    endif
endfunction

function! PyCount(haystack, needle)
    let counter = 0
    let index = match(a:haystack, a:needle)
    while index > -1
        let counter = counter + 1
        let index = match(a:haystack, a:needle, index+1)
    endwhile
    return counter
endfunction

function! PyStringFormat(count)
    let st = g:snip_start_tag
    let et = g:snip_end_tag

    if a:count == 0
        return ""
    elseif a:count == 1
        return " % ".st.et
    else
        return ' % ('.join(repeat([st.et], a:count), ', ').')'
    endif
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet sf '".st."s".et."'".st."s:PyStringFormat(PyCount(@z, '%[^%]'))".et.st.et
exec "Snippet class class ".st."ClassName".et."(".st."object".et."):<CR><CR><Tab>def __init__(self".st."args:PyInit(@z)".et."):<CR><Tab>".st."args:PyInitVars(@z)".et.st.et
exec "Snippet . self.".st.et
exec "Snippet @@ self.__class__.".st.et
exec "Snippet def def ".st."name".et."(".st."self".et."):<CR><Tab>".st.et
exec "Snippet ifmain if __name__ == '__main__':<CR><Tab>".st.et
exec "Snippet pyhead #!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR>".st.et
exec "Snippet for for ".st."item".et." in ".st."seq".et.":<CR><Tab>".st.et
exec "Snippet while while ".st."True".et.":<CR><Tab>".st.et
exec "Snippet from from ".st.et." import ".st.et
exec "Snippet pdb import pdb;pdb.set_trace()"

" i18n
exec "Snippet _ _(u'".st.et."')"

" comments
for ctag in ['TODO', 'FIXME', 'XXX']
    exec "Snippet ".ctag." #<CR># ".ctag.": ".st.et."<CR>#"
endfor
exec "Snippet # #<CR># ".st.et."<CR>#"
