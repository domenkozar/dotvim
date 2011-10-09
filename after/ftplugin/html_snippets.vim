if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

" Doctypes
exec "Snippet doctype <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Frameset//EN\"<CR>  \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\"><CR>".st.et
exec "Snippet doc4s <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"<CR>  \"http://www.w3.org/TR/html4/strict.dtd\"><CR>".st.et
exec "Snippet doc4t <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"<CR>  \"http://www.w3.org/TR/html4/loose.dtd\"><CR>".st.et
exec "Snippet doc4f <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"<CR>  \"http://www.w3.org/TR/html4/frameset.dtd\"><CR>".st.et
exec "Snippet docxs <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\"<CR>  \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><CR>".st.et
exec "Snippet docxt <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Transitional//EN\"<CR>  \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><CR>".st.et
exec "Snippet docxf <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Frameset//EN\"<CR>  \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\"><CR>".st.et

" Meta tags
exec "Snippet <html <html xmlns=\"http://www.w3.org/1999/xhtml\">".st.et."</html>"
exec "Snippet <style <style type=\"text/css\">".st.et."</style>"
exec "Snippet <script <script type=\"text/javascript\">".st.et."</script>"
exec "Snippet <scriptsrc <script src=\"".st.et."\" type=\"text/javascript\"></script>"
exec "Snippet <textarea <textarea name=\"".st.et."\" rows=\"".st."8".et."\" cols=\"".st."40".et."\">".st.et."</textarea>"
exec "Snippet <css <link rel=\"stylesheet\" href=\"".st.et."\" type=\"text/css\" media=\"".st."screen".et."\" ".st.et." />"
exec "Snippet <ct <meta http-equiv=\"Content-Type\" content=\"".st.et."\" />"

" Form Tags
exec "Snippet <form <form action=\"".st.et."\" method=\"".st."get".et."\">".st.et."</form>"
exec "Snippet <input <input type=\"".st."text".et."\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et
for ctype in ['text', 'hidden', 'password', 'checkbox', 'radio', 'button']
  exec "Snippet <i".ctype." <input type=\"".ctype."\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et
endfor
exec "Snippet <isubmit <input type=\"submit\" value=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet <ireset <input type=\"reset\" value=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet <select <select name=\"".st.et."\">"
exec "Snippet <option <option value=\"".st.et."\">".st.et."</option>"

" Normal Tags
for ctag in ['div', 'span']
    exec "Snippet <".ctag." <".ctag." ".st."class".et."=\"".st.et."\">".st.et."</".ctag.">"
endfor
exec "Snippet <a <a href=\"".st.et."\">".st.et."</a>"
for ctag in ['head', 'title', 'body', 'li', 'ul', 'ol', 'p', 'dd', 'dl', 'dt', 'table', 'tr', 'td', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'tt']
    exec "Snippet <".ctag." <".ctag.">".st.et."</".ctag.">"
endfor
