if exists("b:current_syntax")
  finish
endif

syntax match plistViewDictKey "\(^\([- ] \)*\)\@<=[^: -][^:]*:\@="
highlight link plistViewDictKey Type

syntax keyword plistViewBoolean true false contained
highlight link plistViewBoolean Boolean

syntax match plistViewString "\(^\([- ] \)*\)\@<=[^: -][^:]\+$" contains=CONTAINED
syntax match plistViewString "\(: \)\@<=.\+$" contains=CONTAINED
highlight link plistViewString String

syntax match plistViewNumber "\d\d*" contained
highlight link plistViewNumber Number

syntax match plistViewSpecial "\v\:"
highlight link plistViewSpecial Special

let b:current_syntax = "plist-data"
