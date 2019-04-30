function! GetPlistFold(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif

  if getline(a:lnum) =~? '<\(dict\|array\)>'
    return 'a1'
  endif

  if getline(a:lnum) =~? '<\/\(dict\|array\)>'
    return 's1'
  endif

  return '='
endfunction

