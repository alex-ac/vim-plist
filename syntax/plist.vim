if exists("b:current_syntax")
  finish
endif

syntax keyword plistTags dict key string array true false
highlight link plistTags keyword

let b:current_syntax = "plist"
