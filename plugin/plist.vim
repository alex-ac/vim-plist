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

let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import os
import sys

import vim

plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = os.path.normpath(os.path.join(plugin_root_dir, '..', 'python'))

sys.path.insert(0, python_root_dir)
import vim_plist
EOF

function! LoadPlist()
  python3 vim_plist.load_plist()
endfunction

command! Plview call LoadPlist()
