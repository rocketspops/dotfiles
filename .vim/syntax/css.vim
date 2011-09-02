"
" Vim syntax file
"
" Language:	CSS
" Maintainer:	Billy Whited (rocketspops@gmail.com)
" URL:		
" Last Change:  September 2nd, 2011	

if exists("b:current_syntax")
  finish
endif

set iskeyword=@,-
syn sync fromstart

syn keyword cssTagName abbr acronym address applet area a b base
syn keyword cssTagName basefont bdo big blockquote body br button
syn keyword cssTagName caption center cite code col colgroup dd del
syn keyword cssTagName dfn dir div dl dt em fieldset font form frame
syn keyword cssTagName frameset h1 h2 h3 h4 h5 h6 head hr html img i
syn keyword cssTagName iframe img input ins isindex kbd label legend li
syn keyword cssTagName link map menu meta noframes noscript ol optgroup
syn keyword cssTagName option p param pre q s samp script select small
syn keyword cssTagName span strike strong style sub sup tbody td
syn keyword cssTagName textarea tfoot th thead title tr tt ul u var
syn match cssTagName "\<table\>"
syn match cssTagName "\*"

syn match cssTagName "@page\>" nextgroup=cssDefinition

syn match cssSelectorOp "[+>.]"
syn match cssSelectorOp2 "[~|]\?=" contained
syn region cssAttributeSelector matchgroup=cssSelectorOp start="\[" end="]" transparent contains=cssUnicodeEscape,cssSelectorOp2,cssStringQ,cssStringQQ

try
syn match cssIdentifier "#[A-Za-zÀ-ÿ_@][A-Za-zÀ-ÿ0-9_@-]*"
catch /^.*/
syn match cssIdentifier "#[A-Za-z_@][A-Za-z0-9_@-]*"
endtry


syn match cssMedia "@media\>" nextgroup=cssMediaType skipwhite skipnl
syn keyword cssMediaType contained screen print aural braile embosed handheld projection ty tv all nextgroup=cssMediaComma,cssMediaBlock skipwhite skipnl
syn match cssMediaComma "," nextgroup=cssMediaType skipwhite skipnl
syn region cssMediaBlock transparent matchgroup=cssBraces start='{' end='}' contains=cssTagName,cssError,cssDefinition,cssURL,cssUnicodeEscape,cssIdentifier

syn match cssValueInteger contained "[-+]\=\d\+"
syn match cssValueNumber contained "[-+]\=\d\+\(\.\d*\)\="
syn match cssValueLength contained "\(\d\)\@<=\(%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\|rem\)"
syn match cssValueAngle contained "[-+]\=\d\+\(\.\d*\)\=\(deg\|grad\|rad\)"
syn match cssValueTime contained "+\=\d\+\(\.\d*\)\=\(ms\|s\)"
syn match cssValueFrequency contained "+\=\d\+\(\.\d*\)\=\(Hz\|kHz\)"

syn match cssFontDescriptor "@font-face\>" nextgroup=cssFontDescriptorBlock skipwhite skipnl
syn region cssFontDescriptorBlock contained transparent matchgroup=cssBraces start="{" end="}" contains=cssComment,cssError,cssUnicodeEscape,cssFontProp,cssFontAttr,cssCommonAttr,cssStringQ,cssStringQQ,cssFontDescriptorProp,cssValue.*,cssFontDescriptorFunction,cssUnicodeRange,cssFontDescriptorAttr
syn match cssFontDescriptorProp contained "\<\(unicode-range\|unit-per-em\|panose-1\|cap-height\|x-height\|definition-src\)\>"
syn keyword cssFontDescriptorProp contained src stemv stemh slope ascent descent widths bbox baseline centerline mathline topline
syn keyword cssFontDescriptorAttr contained all
syn region cssFontDescriptorFunction contained matchgroup=cssFunctionName start="\<\(uri\|url\|local\|format\)\s*(" end=")" contains=cssStringQ,cssStringQQ oneline keepend
syn match cssUnicodeRange contained "U+[0-9A-Fa-f?]\+"
syn match cssUnicodeRange contained "U+\x\+-\x\+"

syn region cssAttr matchgroup=cssAttrPunc start=":" end=";" keepend oneline 
\contains=cssValueNumber,cssValueLength,cssFunction,cssColorAttr,
\cssImportant,cssCommonAttr,cssBgAttr,cssGenContentAttr,cssTextAttr,
\cssBoxAttr,cssPagingAttr,cssFontAttr,cssUIAttr,cssRenderAttr,cssAuralAttr

syn region cssFunction contained matchgroup=cssFunctionName
\ start="\<\(attr\|clip\|counter\|rgb\|rgba\|rect\|url\)\s*(" end=")"
\ oneline keepend

"=C O L O R  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssColorProp contained color

syn keyword cssColorAttr contained aliceblue antiquewhite aqua aquamarine azure
                                 \ beige bisque black blanchedalmond blue blueviolet 
                                 \ brown burlywood cadetblue chartreuse chocolate coral
                                 \ cornflowerblue cornsilk crimson cyan darkblue
                                 \ darkcyan darkgoldenrod darkgray darkgrey darkgreen
                                 \ darkkhaki darkmagenta darkolivegreen darkorange 
                                 \ darkorchid darkred darksalmon darkseagreen
                                 \ darkslateblue darkslategray darkslategrey 
                                 \ darkturquoise darkviolet deeppink deepskyblue
                                 \ dimgray dimgrey dodgerblue firebrick floralwhite
                                 \ forestgreen fuchsia gainsboro ghostwhite gold
                                 \ goldenrod gray grey green greenyellow honeydew
                                 \ hotpink indianred indigo ivory khaki lavender
                                 \ lavenderblush lawngreen lemonchiffon lightblue
                                 \ lightcoral lightcyan lightgoldenrodyellow lightgray
                                 \ lightgrey lightgreen lightpink lightsalmon
                                 \ lightseagreen lightskyblue lightslategray
                                 \ lightslategrey lightsteelblue lightyellow lime
                                 \ limegreen linen magenta maroon mediumaquamarine
                                 \ mediumblue mediumorchid mediumpurple mediumseagreen
                                 \ mediumslateblue mediumspringgreen mediumturquoise
                                 \ mediumvioletred midnightblue mintcream mistyrose
                                 \ moccasin navajowhite navy oldlace olive olivedrab
                                 \ orange orangered orchid palegoldenrod palegreen
                                 \ paleturquoise palevioletred papayawhip peachpuff
                                 \ peru pink plum powderblue purple red rosybrown
                                 \ royalblue saddlebrown salmon sandybrown seagreen
                                 \ seashell sienna silver skyblue slateblue slategray
                                 \ slategrey snow springgreen steelblue tan teal
                                 \ thistle tomato turquoise violet wheat 
                                 \ white whitesmoke yellow yellowgreen

syn match cssColorAttr contained "\<transparent\>"
syn match cssColorAttr contained "#[0-9A-Fa-f]\{-3}\>"
syn match cssColorAttr contained "#[0-9A-Fa-f]\{-6}\>"

"=C O M M O N  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn match cssImportant contained "!\s*important\>"
syn match cssCommonAttr contained "\<\(auto\|none\|inherit\)\>"

"=B A C K G R O U N D  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssBgProp contained background
                              \ background-attachment
                              \ background-color
                              \ background-image
                              \ background-position

syn match cssBgAttr contained "\<\(center\|fixed\|no-repeat\|scroll\|
                               \repeat-x\|repeat-y\)\>"

"=G E N E R A T E D  C O N T E N T  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn match cssGenContentProp contained "\<quotes\>" 

syn keyword cssGenContentProp contained content 
                                      \ counter-reset
                                      \ counter-increment
                                      \ list-style
                                      \ list-style-type
                                      \ list-style-position
                                      \ list-style-image
                                       
syn match cssGenContentAttr contained "\<\(armenian\|circle\|decimal\(-leading-zero\)
                                       \\|cjk-ideographic\|disc\|georgian\|hebrew\|
                                       \inside\|\(lower\|upper\)-\(roman\|alpha\|
                                       \greek\|latin\)\|outside\|\(no-\)\=\(open\|
                                       \close\)-quote\|square\|\(hiragana\|
                                       \katakana\)\(-iroha\)\=\)\>"

"=T E X T  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssTextProp contained letter-spacing
                                \ text-align 
                                \ text-decoration 
                                \ text-indent
                                \ text-shadow
                                \ text-transform 
                                \ unicode-bidi
                                \ vertical-align
                                \ word-spacing

syn match cssTextAttr contained "\<\(baseline\|blink\|capitalize\|center\|
                                 \justify\|line-through\|lowercase\|middle\|
                                 \overline\|sub\|super\|text-bottom\|
                                 \text-top\|underline\|uppercase\)\>" 

"=B O X  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn match cssBoxProp contained "\<\(border-\(\(\(top\|right\|bottom\|left\)-\)
                                \\=\(width\|color\|style\)\)\=\|outline\(-\
                                \(width\|style\|color\)\)\=\|margin\|padding\|
                                \border\|\(-\(top\|right\|bottom\|left\)\)\=\)\>"

syn keyword cssBoxProp contained clear 
                               \ clip
                               \ float 
                               \ height 
                               \ max-height
                               \ max-width
                               \ min-height
                               \ min-width
                               \ overflow
                               \ overflow-x
                               \ overflow-y
                               \ visibility
                               \ width
                               \ z-index

syn match cssBoxAttr contained "\<\(collapse\|dashed\|dotted\|double\|groove\|
                                \hidden\|inset\|invert\|\outset\|ridge\|
                                \scroll\|solid\|thick\|thin\|visible\)\>"

"=P A G I N G  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssPagingProp contained inside
                                  \ marks
                                  \ orphans
                                  \ page-break-before
                                  \ page-break-after
                                  \ page-break-inside
                                  \ size
                                  \ widows

syn match cssPagingAttr contained "\<\(landscape\|portrait\|crop\|cross\|
                                   \always\|avoid\)\>"

"=F O N T  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssFontProp contained font-family
                                \ font-style
                                \ font-variant
                                \ font-weight
                                \ font-size
                                \ font-size-adjust
                                \ font-stretch

syn match cssFontAttr contained "\<\(Arial\|Calibri\|Candara\|Cambria\|
                                 \Consolas\|Corbel\|Constantia\|Courier\|
                                 \Georgia\|Helvetica\|Lucida\|\Tahoma\|
                                 \Times\|Verdana\)\>" 

syn match cssFontAttr contained "\<\(bold\|bolder\|caption\|cursive\|
                                 \fantasy\|icon\|italic\|large\|larger\|
                                 \lighter\|medium\|menu\|message-box\|
                                 \monospace\|normal\|oblique\|sans-serif\|
                                 \serif\|small\|small-caps\|small-caption\|
                                 \smaller\|status-bar\|\(\(ultra\|extra\|semi\)
                                 \-\)\=\(condensed\|expanded\)\|x-large\|
                                 \x-small\|xx-large\|xx-small\)\>"

"=U S E R  I N T E R F A C E  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssUIProp contained cursor

syn match cssUIAttr contained "\<\(default\|crosshair\|progress\|pointer\|
                               \move\|wait\|help\|\([ns]\=[ew]\=-resize\)\)\>"

"=R E N D E R  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssRenderProp contained bottom 
                                  \ direction 
                                  \ display 
                                  \ left 
                                  \ marker-offset 
                                  \ position 
                                  \ right 
                                  \ top 
                                  \ white-space 

syn match cssRenderAttr contained "\<\(absolute\|block\|bidi-override\|bottom\|
                                   \compact\|embed\|fixed\|inline\|inline-block\|
                                   \inline-table\|left\|list-item\|ltr\|marker\|
                                   \nowrap\|pre\|relative\|right\|rtl\|run-in\|
                                   \static\|table\(-\(row-group\|\(header\|
                                   \footer\)-group\|row\|column\(-group\)\=\|
                                   \cell\|caption\)\)\=\|top\)\>" 

"=A U R A L  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssAuralProp contained azimuth
                                 \ cue
                                 \ cue-after
                                 \ cue-before
                                 \ elevation
                                 \ pause 
                                 \ pause-after
                                 \ pause-before
                                 \ pitch
                                 \ pitch-range
                                 \ play-during
                                 \ richness
                                 \ speak
                                 \ speak-header
                                 \ speak-numeral
                                 \ speak-punctuation
                                 \ speech-rate
                                 \ stress
                                 \ voice-family
                                 \ volume

syn match cssAuralAttr contained "\<\(above\|always\|angle\|behind\|below\|
                                  \center\|center-left\|center-right\|code\|
                                  \continuous\|digits\|far-left\|far-right\|
                                  \fast\|faster\|high\|higher\|left\|left-side\|
                                  \leftwards\|level\|loud\|low\|lower\|medium\|
                                  \mix\|normal\|once\|repeat\|right\|right-side\|
                                  \rightwards\|silent\|slow\|slower\|soft\|
                                  \spell-out\|\(x-\)\=\(fast\|high\|loud\|low\|
                                  \slow\|soft\)\)\>"

"=T A B L E  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn match cssTableProp contained "\<\(caption-side\|table-layout\|border-collapse\|border-spacing\|empty-cells\|speak-header\)\>"
syn keyword cssTableAttr contained fixed collapse separate show hide once always

" FIXME: This allows cssMediaBlock before the semicolon, which is wrong.
syn region cssInclude start="@import" end=";" contains=cssComment,cssURL,cssUnicodeEscape,cssMediaType
syn match cssBraces contained "[{}]"
syn match cssError contained "{@<>"
syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape
syn match cssBraceError "}"

syn match cssPseudoClass ":\S*" contains=cssPseudoClassId,cssUnicodeEscape
syn keyword cssPseudoClassId contained link visited active hover focus before after left right
syn match cssPseudoClassId contained "\<first\(-\(line\|letter\|child\)\)\=\>"
syn region cssPseudoClassLang matchgroup=cssPseudoClassId start=":lang(" end=")" oneline

syn region cssComment start="/\*" end="\*/" keepend contains=@Spell

syn match cssUnicodeEscape "\\\x\{1,6}\s\?"
syn match cssSpecialCharQQ +\\"+ contained
syn match cssSpecialCharQ +\\'+ contained
syn region cssStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cssUnicodeEscape,cssSpecialCharQQ
syn region cssStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cssUnicodeEscape,cssSpecialCharQ
syn match cssClassName "\.[A-Za-z][A-Za-z0-9_-]\+"


hi def link cssComment Comment
hi def link cssTagName Statement
hi def link cssSelectorOp Special
hi def link cssSelectorOp2 Special
hi def link cssFontProp StorageClass
hi def link cssColorProp StorageClass
hi def link cssTextProp StorageClass
hi def link cssBoxProp StorageClass
hi def link cssRenderProp StorageClass
hi def link cssAuralProp StorageClass
hi def link cssRenderProp StorageClass
hi def link cssGenContentProp StorageClass
hi def link cssPagingProp StorageClass
hi def link cssTableProp StorageClass
hi def link cssUIProp StorageClass
hi def link cssFontAttr Type
hi def link cssColorAttr Type
hi def link cssTextAttr Type
hi def link cssBoxAttr Type
hi def link cssRenderAttr Type
hi def link cssAuralAttr Type
hi def link cssGenContentAttr Type
hi def link cssPagingAttr Type
hi def link cssTableAttr Type
hi def link cssUIAttr Type
hi def link cssCommonAttr Type
hi def link cssPseudoClassId PreProc
hi def link cssPseudoClassLang Constant
hi def link cssValueLength Number
hi def link cssValueInteger Number
hi def link cssValueNumber Number
hi def link cssValueAngle Number
hi def link cssValueTime Number
hi def link cssValueFrequency Number
hi def link cssFunction Constant
hi def link cssURL String
hi def link cssFunctionName Function
hi def link cssColor Constant
hi def link cssIdentifier Function
hi def link cssInclude Include
hi def link cssImportant Special
hi def link cssBraces Function
hi def link cssBraceError Error
hi def link cssError Error
hi def link cssInclude Include
hi def link cssUnicodeEscape Special
hi def link cssStringQQ String
hi def link cssStringQ String
hi def link cssMedia Special
hi def link cssMediaType Special
hi def link cssMediaComma Normal
hi def link cssFontDescriptor Special
hi def link cssFontDescriptorFunction Constant
hi def link cssFontDescriptorProp StorageClass
hi def link cssFontDescriptorAttr Type
hi def link cssUnicodeRange Constant
hi def link cssClassName Function

let b:current_syntax = "css"

