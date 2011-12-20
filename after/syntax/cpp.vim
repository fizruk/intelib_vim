setlocal foldmethod=syntax

function! MyFoldText()
    let nl = v:foldend - v:foldstart + 1
    let indent_level = indent(v:foldstart)
    
    let linetext = getline(v:foldstart)
    let linetext = substitute(linetext, "^ *", "", "")

    " for InteLib Lisp code: remove 'L|' prefixes and commas
    if linetext =~ "^(L|"
        let linetext = substitute(linetext, "\\(\\w\\+\\),", "\\1", "g")
        let linetext = substitute(linetext, "),", ")", "g")
        let linetext = substitute(linetext, "(L|", "(", "g")
        let linetext = substitute(linetext, "$", " ... )", "")
    endif

    let indent = repeat('-', indent_level - 1)

    let txt = indent . ' '. linetext . ' : lines ' . nl . ' '
    return txt
endfunction
set foldtext=MyFoldText()
