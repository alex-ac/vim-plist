if exists("b:current_syntax")
  finish
endif

syntax match plistComments "<?.*?>"
syntax match plistComments "<!DOCTYPE[^>]*>"
syntax match plistComments "<!--.*-->"
highlight link plistComments Comment
syntax keyword plistContainers dict array key
highlight link plistContainers Keyword
syntax keyword plistTypes string array true false
highlight link plistTypes Function

let b:current_syntax = "plist"
