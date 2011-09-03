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

set iskeyword=@,@-@,-
syn sync fromstart

syn keyword cssTagName abbr acronym address applet area a b base
                     \ basefont bdo big blockquote body br button
                     \ caption center cite code col colgroup dd del
                     \ dfn dir div dl dt em fieldset font form frame
                     \ frameset h1 h2 h3 h4 h5 h6 head hr html img i
                     \ iframe img input ins isindex kbd label legend li
                     \ link map menu meta noframes noscript ol optgroup
                     \ option p param pre q s samp script select small
                     \ span strike strong style sub sup table tbody td
                     \ textarea tfoot th thead title tr tt ul u var

syn region cssAttrSelector matchgroup=cssSelectorOp start="\[" end="]" 
\ contains=cssUnicodeEscape,cssStringQ,cssStringQQ
\ transparent 

syn region cssVal matchgroup=cssValPunc start=":" end=";" 
\ contains=cssValueNumber,cssValueLength,cssFunction,cssImportant,
\css.*Val,cssUnicodeRange
\ keepend oneline 

syn region cssFunction contained matchgroup=cssFunctionName
\ start="\<\(annotation\|attr\|clip\|character-variant\|counter\|format\|
\local\|ornaments\|rgb\|rgba\|rect\|stylistic\|styleset\|swash\|uri\|
\url\)\s*(" end=")"
\ contains=cssString,cssStringQQ
\ oneline keepend

syn match cssIdName "#[A-Za-z_][A-Za-z0-9_-]*"
syn match cssClassName "\.[A-Za-z][A-Za-z0-9_-]*"
syn match cssSelectorOp "[*+>.,~|$^]"

"=A T  R U L E  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssAtRule @charset 
                    \ @font-face 
                    \ @import
                    \ @media
                    \ @namespace
                    \ @page 

syn region cssAtRuleUrl start="url(" end=")"
\ contains=cssString,cssStringQQ
\ keepend oneline

syn keyword cssMediaType all
                       \ braille
                       \ embossed
                       \ handheld
                       \ print
                       \ projection
                       \ screen
                       \ speech
                       \ tty
                       \ tv

syn match cssNumVal contained "[-]\=\d\+\(\.\d*\)\="
syn match cssUnitVal contained "\(\d\)\@<=\(%\|cm\|deg\|em\|ex\|grad\|kHz\|
                                \Hz\|in\|mm\|ms\|pc\|pt\|px\|rad\|rem\|s\)"

syn match cssUnicodeRange contained "U+[0-9A-Fa-f?]\+"
syn match cssUnicodeRange contained "U+\x\+-\x\+"
syn match cssUnicodeEscape "\\\x\{1,6}\s\?"

syn region cssComment start="/\*" end="\*/" keepend 
syn region cssSinQuo start=+'+ skip=+\\'+ end=+'+ contains=cssUnicodeEscape
syn region cssDubQuo start=+"+ skip=+\\"+ end=+"+ contains=cssUnicodeEscape

"=C O L O R  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssColorProp contained color

syn keyword cssColorVal contained aliceblue antiquewhite aqua aquamarine azure
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

syn match cssColorVal contained "\<transparent\>"
syn match cssColorVal contained "#[0-9A-Fa-f]\{-3}"
syn match cssColorVal contained "#[0-9A-Fa-f]\{-6}"

"=C O M M O N  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn match cssImportant contained "!\s*important\>"
syn match cssCommonVal contained "\<\(auto\|none\|inherit\)\>"

"=B A C K G R O U N D  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssBgProp contained background
                              \ background-attachment
                              \ background-color
                              \ background-image
                              \ background-position

syn match cssBgVal contained "\<\(center\|fixed\|no-repeat\|scroll\|
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
                                       
syn match cssGenContentVal contained "\<\(armenian\|circle\|decimal\(-leading-zero\)
                                       \\|cjk-ideographic\|disc\|georgian\|hebrew\|
                                       \inside\|\(lower\|upper\)-\(roman\|alpha\|
                                       \greek\|latin\)\|outside\|\(no-\)\=\(open\|
                                       \close\)-quote\|square\|\(hiragana\|
                                       \katakana\)\(-iroha\)\=\)\>"

"=T E X T  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssTextProp contained letter-spacing
                                \ line-height
                                \ text-align 
                                \ text-decoration 
                                \ text-indent
                                \ text-rendering
                                \ text-shadow
                                \ text-transform 
                                \ unicode-bidi
                                \ vertical-align
                                \ word-spacing

syn match cssTextVal contained "\<\(baseline\|blink\|capitalize\|center\|
                                 \justify\|line-through\|lowercase\|middle\|
                                 \optimizeLegibility\|overline\|sub\|super\|
                                 \text-bottom\|text-top\|underline\|
                                 \uppercase\)\>" 

"=B O X  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn match cssBoxProp contained "\<\(border\(-\(top\|right\|bottom\|left\)\)\
                                \=\(-\(color\|style\|width\)\)\=\|outline\
                                \(-\(color\|style\|width\)\)\=\)\>"

syn match cssBoxProp contained "\<\(\(margin\|padding\)\(-\(top\|right\|
                                \bottom\|left\)\)\=\)\>" 

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

syn match cssBoxVal contained "\<\(collapse\|dashed\|dotted\|double\|groove\|
                                \hidden\|inset\|invert\|\outset\|ridge\|
                                \scroll\|solid\|thick\|thin\|visible\)\>"

"=P A G I N G  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssPageProp contained inside
                                  \ marks
                                  \ orphans
                                  \ page-break-before
                                  \ page-break-after
                                  \ page-break-inside
                                  \ size
                                  \ widows

syn match cssPageVal contained "\<\(landscape\|portrait\|crop\|cross\|
                                   \always\|avoid\)\>"

"=F O N T  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssFontProp contained font-family
                                \ font-feature-settings
                                \ font-kerning
                                \ font-language-override
                                \ font-style
                                \ font-variant
                                \ font-variant-alternates
                                \ font-variant-caps
                                \ font-variant-east-asian
                                \ font-variant-ligatures
                                \ font-variant-numeric
                                \ font-weight
                                \ font-size
                                \ font-size-adjust
                                \ font-stretch
                                \ src
                                \ unicode-range
                                \ vertical-position

syn match cssFontVal contained "\<\(Arial\|Calibri\|Candara\|Cambria\|
                                 \Consolas\|Corbel\|Constantia\|Courier\|
                                 \Georgia\|Helvetica\|Lucida\|\Tahoma\|
                                 \Times\|Verdana\)\>" 

syn match cssFontVal contained "\<\(additional-ligatures\|all-petite-caps\|
                                 \all-small-caps\|bold\|bolder\|caption\|
                                 \contextual\|common-ligatures\|cursive\|
                                 \diagonal-fractions\|fantasy\|full-width\|
                                 \historical-forms\|historical-ligatures\|
                                 \hojo-kanji\|icon\|italic\|jis78\|jis83\|
                                 \jis90\|jis04\|large\|larger\|lighter\|
                                 \lining-nums\|medium\|menu\|message-box\|
                                 \monospace\|nlckanji\|no-additional-ligatures\|
                                 \no-contextual\|no-common-ligatures\|
                                 \no-historical-ligatures\|normal\|oblique\|
                                 \oldstyle-nums\|ordinal\|petite-caps\|
                                 \proportional-nums\|proportional-width\|
                                 \ruby\|sans-serif\|serif\|simplified\|
                                 \slashed-zero\|small\|small-caps\|
                                 \small-caption\|smaller\|stacked-fractions\|
                                 \status-bar\|subscript\|superscript\|
                                 \tabular-nums\|titling-caps\|traditional\|
                                 \unicase\|\(\(ultra\|extra\|semi\)
                                 \-\)\=\(condensed\|expanded\)\|x-large\|
                                 \x-small\|xx-large\|xx-small\)\>"

"=U S E R  I N T E R F A C E  P R O P E R T I E S
"----------------------------------------------------------------------------"

syn keyword cssUIProp contained cursor

syn match cssUIVal contained "\<\(default\|crosshair\|progress\|pointer\|
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

syn match cssRenderVal contained "\<\(absolute\|block\|bidi-override\|bottom\|
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

syn match cssAuralVal contained "\<\(above\|always\|angle\|behind\|below\|
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

syn keyword cssTableProp contained border-collapse 
                                 \ border-spacing 
                                 \ caption-side 
                                 \ empty-cells 
                                 \ speak-header 
                                 \ table-layout 

syn match cssTableVal contained "\<\(fixed\|collapse\|separate\|show\|hide\|
                                  \once\|always\)\>"

syn match cssError contained "{@<>"
syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=css.*Val,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape
syn match cssBraceError "}"

syn match cssPseudoClass ":\S*" contains=cssPseudoClassId
syn keyword cssPseudoClassId contained link visited active hover focus before after left right
syn match cssPseudoClassId contained "\<first\(-\(line\|letter\|child\)\)\=\>"
syn region cssPseudoClassLang matchgroup=cssPseudoClassId start=":lang(" end=")" oneline

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
hi def link cssFontVal Type
hi def link cssColorVal Type
hi def link cssTextVal Type
hi def link cssBoxVal Type
hi def link cssRenderVal Type
hi def link cssAuralVal Type
hi def link cssGenContentVal Type
hi def link cssPagingVal Type
hi def link cssTableVal Type
hi def link cssUIVal Type
hi def link cssCommonVal Type
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
hi def link cssIdName Function
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
hi def link cssFontDescriptorVal Type
hi def link cssUnicodeRange Constant
hi def link cssClassName Function

let b:current_syntax = "css"

