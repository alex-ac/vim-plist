if exists("b:current_syntax")
  finish
endif

syntax match plistComments "<?.*?>"
syntax match plistComments "<!DOCTYPE[^>]*>"
syntax match plistComments "<!--.*-->"
highlight link plistComments Comment

syntax region plistDictKey start=/\(<key>\)\@<=/ skip=/[^<>]/ end=/\(<\/key>\)\@=/
highlight link plistDictKey Type

syntax region plistString start=/\(<string>\)\@<=/ skip=/[^<>]/ end=/\(<\/string>\)\@=/
highlight link plistString String

syntax region plistNumber start=/\(<integer>\)\@<=/ skip=/[0-9]/ end=/\(<\/integer>\)\@=/
highlight link plistNumber Number

syntax keyword plistContainers dict array key string integer
highlight link plistContainers Keyword

syntax keyword plistTypes true false
highlight link plistTypes Boolean

syntax match xmlTags "\v\<"
syntax match xmlTags "\v\>"
syntax match xmlTags "\v\="
syntax match xmlTags "\v\/"
highlight link xmlTags Special

let b:current_syntax = "plist"
