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

set iskeyword=@,48-57,@-@,-
syn sync fromstart

"=G L O B A L
"----------------------------------------------------------------------------"

syn region cssComment start="/\*" end="\*/" keepend 
syn region cssQuo start=+\'\|\"+ skip=+\\'\|\\"+ end=+\'\|\"+ keepend 

"=B A S I C  S E L E C T O R S
"----------------------------------------------------------------------------"

syn keyword cssTagName a abbr acronym address applet area article
                     \ aside audio b base basefont bdo big blockquote
                     \ body br button canvas caption center cite code
                     \ col colgroup command datalist dd del details
                     \ dfn dir div dl dt em embed fieldset font form
                     \ figcaption figure footer frame frameset h1 h2 
                     \ h3 h4 h5 h6 head header hgroup hr html img i
                     \ iframe img input ins isindex kbd keygen label
                     \ legend li link map mark menu meta meter nav
                     \ noframes noscript object ol optgroup option 
                     \ output p param pre progress q rp rt ruby s
                     \ samp script section select small span strike
                     \ strong style sub summary sup table tbody td 
                     \ textarea tfoot th thead time title tr tt ul 
                     \ u var variant video xmp 

syn match cssSelectorOp "[*+>.,_|~-]"
syn match cssAttrSelectorOp "[=*~|$^]"
syn match cssIdName "#[A-Za-z_][A-Za-z0-9_-]*"
syn match cssClassName "\.[A-Za-z][A-Za-z0-9_-]*"

syn region cssAttrSelector matchgroup=cssAttrSelector start="\[" end="]" 
\ contains=cssAttrSelectorOp,cssQuo
\ transparent 

"=P S E U D O  C L A S S  S E L E C T O R S 
"----------------------------------------------------------------------------"

syn match cssPseudoClassSelector "\(:[a-z\-]\+\|::[a-z\-]\+\)" 
\ contains=cssPseudoClass,cssPseudoClassExpression

syn keyword cssPseudoClass contained active
                                   \ after 
                                   \ before 
                                   \ checked
                                   \ choices
                                   \ default
                                   \ disabled
                                   \ empty
                                   \ enabled
                                   \ first
                                   \ first-child
                                   \ first-letter
                                   \ first-line
                                   \ first-of-type
                                   \ focus 
                                   \ hover 
                                   \ in-range
                                   \ indeterminate
                                   \ invalid
                                   \ last-child
                                   \ last-of-type
                                   \ left
                                   \ link 
                                   \ optional
                                   \ only-of-type
                                   \ out-of-range
                                   \ read-only
                                   \ read-write
                                   \ repeat-index
                                   \ repeat-item
                                   \ required
                                   \ right
                                   \ root
                                   \ selection
                                   \ target
                                   \ value
                                   \ valid
                                   \ visited 

syn region cssPseudoClassExpression contained matchgroup=cssPseudoClass 
\ start="\(:lang\|:nth-child\|:nth-of-type\|:nth-last-of-type\|
         \:nth-last-child\|:not\)(" end=")" 
\ contains=cssNumVal,cssUnitVal,cssSelectorOp
\ keepend oneline

"=A T  R U L E  S E L E C T O R 
"----------------------------------------------------------------------------"

syn keyword cssAtRule @charset 
                    \ @color-profile
                    \ @font-face 
                    \ @import
                    \ @media
                    \ @namespace
                    \ @page 

syn region cssAtRuleUrl start="url(" end=")"
\ contains=cssQuo
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

"=D E C L A R A T I O N  B L O C K
"----------------------------------------------------------------------------"

syn region cssDecBlock transparent matchgroup=cssBraces start='{' end='}' 
\ contains=cssProp,cssVal,cssBraceError
\ keepend

syn region cssProp start="\(^\|\(\;\s*\)\@<=\w\|\({\s*\)\@<=\w\)" 
\ end="\w\(\:\)\@="
\ contains=@cssPropGroup
\ contained keepend oneline

syn region cssVal matchgroup=cssValPunc start="\:" end="\;" 
\ contains=@cssValGroup
\ contained keepend 

syn cluster cssValGroup contains=css.*Val,css.*Quo
syn cluster cssPropGroup contains=css.*Prop

syn match cssBraceError contained "{"
syn match cssBraceError "}"

"=G L O B A L  P R O P S + V A L U E S
"----------------------------------------------------------------------------"

syn region cssFuncVal transparent contained matchgroup=cssFuncValName
\ start="\<\(annotation\|attr\|clip\|character-variant\|counter\|format\|
         \hsl\|hsla\|local\|ornaments\|rgb\|rgba\|rect\|stylistic\|
         \styleset\|swash\|uri\|url\)(" end=")"
\ contains=cssQuo,cssSelectorOp,cssNumVal
\ oneline keepend

syn match cssImportantVal contained "!\s*important\>"

syn match cssSharedVal contained "\<\(absolute\|always\|auto\|avoid\|border-box\|
                                  \center\|content-box\|fast\|left\|inherit\|
                                  \none\|normal\|medium\|padding-box\|right\|
                                  \scroll\|slow\)\>"

syn match cssUnicodeVal contained "\(U+[0-9A-Fa-f?]\+[+-][0-9A-Fa-f?]\+
                                   \\|U+[0-9A-Fa-f?]\+\|\\\x\{1,6\}\(\w\|
                                   \\s\w\)\@!\)"

syn match cssNumVal contained "[-]\=\d\+\(\.\d*\)\="

syn match cssUnitVal contained "\(\d\)\@<=\(%\|cm\|deg\|em\|ex\|grad\|kHz\|
                                \Hz\|in\|mm\|ms\|n\|pc\|pt\|px\|rad\|rem\|s\)"

"=B A C K G R O U N D  and  B O R D E R S  M O D U L E       W3C CR 2/15/2011
"----------------------------------------------------------------------------"

syn match cssBgProp contained "\<\(border\(-\(top\|right\|bottom\|left\)\)
                               \\=\(-\(color\|style\|width\)\)\=\)\>"

syn match cssBgProp contained "\<\(border-radius\(-\(bottom\|top\)\(-\(left\|
                               \right\)\)\)\=\)\|\(border-image\(-\(outset\|
                               \repeat\|slice\|source\|width\)\)\=\)\>"

syn keyword cssBgProp contained background
                              \ background-attachment
                              \ background-clip
                              \ background-color
                              \ background-image
                              \ background-origin
                              \ background-position
                              \ background-repeat
                              \ background-size
                              \ box-decoration-break
                              \ box-shadow

syn match cssBgVal contained "\<\(center\|contain\|cover\|clone\|fixed\|no-repeat\|
                              \repeat-x\|repeat-y\|round\|slice\|space\)\>"

"=BO X  P R O P S + V A L U E S
"----------------------------------------------------------------------------"


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
                               \ zoom

syn match cssBoxVal contained "\<\(collapse\|dashed\|dotted\|double\|fill\|
                               \groove\|hidden\|inset\|invert\|
                               \outset\|outset\|ridge\|scroll\|solid\|
                               \stretch\|thick\|thin\|visible\)\>"

"C S S 3  =C O L O R  M O D U L E                              W3C R 6/7/2011 
"----------------------------------------------------------------------------"

syn keyword cssColorProp contained color currentColor opacity

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
syn match cssColorVal contained "#[0-9A-Fa-f]\{3}"
syn match cssColorVal contained "#[0-9A-Fa-f]\{6}"

"=F O N T  P R O P S + V A L U E S
"----------------------------------------------------------------------------"

syn keyword cssFontProp contained font
                                \ font-family
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
                                \lining-nums\|menu\|message-box\|
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

"C S S 2.1  =G E N E R A T E D  C O N T E N T                  W3C R 6/7/2011
"----------------------------------------------------------------------------"

syn match cssGenConProp contained "\<\quotes\>"

syn keyword cssGenConProp contained content 
                                  \ counter-reset
                                  \ counter-increment
                                  \ list-style
                                  \ list-style-type
                                  \ list-style-image
                                  \ list-style-position
                                       
syn match cssGenConVal contained "\<\(armenian\|circle\|decimal\(-leading-zero\)\|
                                  \cjk-ideographic\|disc\|georgian\|hebrew\|
                                  \inside\|\(lower\|upper\)-\(roman\|alpha\|
                                  \greek\|latin\)\|outside\|\(no-\)\=\(open\|
                                  \close\)-quote\|square\|\(hiragana\|
                                  \katakana\)\(-iroha\)\=\)\>"

"C S S 3  =M A R Q U E E  M O D U L E                        W3C CR 12/5/2008
"----------------------------------------------------------------------------"

syn keyword cssMarqProp contained marquee-direction
                                \ marquee-play-count
                                \ marquee-speed
                                \ marquee-style
                                \ overflow-style

syn match cssMarqValue contained "\<\(alternate\|forward\|marquee-block\|marquee-line\|slide\|reverse\)\>"

"C S S 3  =MU L T I - C O L U M N  L A Y O U T  M O D U L E  W3C CR 3/12/2011
"----------------------------------------------------------------------------"

syn keyword cssMultiColProp contained break-after
                                    \ break-after
                                    \ break-inside
                                    \ columns
                                    \ column-count
                                    \ column-fill
                                    \ column-gap
                                    \ column-width
                                    \ column-rule
                                    \ column-rule-color
                                    \ column-rule-style
                                    \ column-rule-width
                                    \ column-span

syn match cssMultiColVal contained "\<\(all\|avoid-page\|avoid-column\|
                                    \balance\|column\|page\)\>"

"C S S 2.1  =P A G E D  M E D I A                              W3C R 6/7/2011
"----------------------------------------------------------------------------"

syn keyword cssPageProp contained inside
                                \ marks
                                \ orphans
                                \ page-break-before
                                \ page-break-after
                                \ page-break-inside
                                \ size
                                \ widows

syn match cssPageVal contained "\<\(landscape\|portrait\|crop\|cross\)\>"

"=R E N D E R  P R O P S + V A L U E S
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

syn match cssRenderVal contained "\<\(block\|bidi-override\|bottom\|
                                   \compact\|embed\|fixed\|inline\|inline-block\|
                                   \inline-table\|left\|list-item\|ltr\|marker\|
                                   \nowrap\|pre\|relative\|right\|rtl\|run-in\|
                                   \static\|table\(-\(row-group\|\(header\|
                                   \footer\)-group\|row\|column\(-group\)\=\|
                                   \cell\|caption\)\)\=\|top\)\>" 

"C S S 3  =S P E E C H  M O D U L E                          W3C WD 8/18/2011
"----------------------------------------------------------------------------"

syn keyword cssSpeechProp contained cue
                                  \ cue-after
                                  \ cue-before
                                  \ pause 
                                  \ pause-after
                                  \ pause-before
                                  \ play-during
                                  \ richness
                                  \ rest
                                  \ rest-after
                                  \ rest-before
                                  \ speak
                                  \ speak-as
                                  \ voice-balance
                                  \ voice-duration
                                  \ voice-family
                                  \ voice-rate
                                  \ voice-pitch
                                  \ voice-range
                                  \ voice-stress
                                  \ voice-volume

syn match cssSpeechVal contained "\<\(child\|code\|continuous\|digits\|
                                 \faster\|female\|high\|literal-punctuation\|
                                 \leftwards\|loud\|low\|lower\|male\|mix\|
                                 \moderate\|neutral\|no-punctuation\|normal\|
                                 \old\|preserve\|rightwards\|silent\|slower\|
                                 \soft\|spell-out\|\(x-\)\=\(fast\|high\|
                                 \loud\|low\|reduced\|soft\|strong\|young\|
                                 \weak\)\)\>"

"=T A B L E  P R O P S + V A L U E S
"----------------------------------------------------------------------------"

syn keyword cssTableProp contained border-collapse 
                                 \ border-spacing 
                                 \ caption-side 
                                 \ empty-cells 
                                 \ speak-header 
                                 \ table-layout 

syn match cssTableVal contained "\<\(fixed\|collapse\|separate\|show\|hide\|
                                  \once\)\>"

"=T E X T  P R O P S + V A L U E S
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

"=BA S I C  U S E R  I N T E R F A C E  M O D U L E          W3C CR 5/11/2004
"----------------------------------------------------------------------------"

syn keyword cssUIProp contained appearance
                              \ box-sizing
                              \ cursor
                              \ icon
                              \ nav-index
                              \ nav-up
                              \ nav-right
                              \ nav-down
                              \ nav-left
                              \ outline-color
                              \ outline-offset
                              \ outline-style
                              \ outline-width
                              \ resize

syn match cssUIVal contained "\<\(alias\|all-scroll\|both\|cell\|
                              \context-menu\|col-resize\|copy\|crosshair\|
                              \help\|horizontal\|move\|no-drop\|not-allowed\|
                              \pointer\|progress\|row-resize\|text\|vertical\|
                              \vertical-text\|wait\|\([ns]\=[ew]\=-resize\)\|
                              \ew-resize\|ns-resize\|newsw-resize\|
                              \nwse-resize\)\>"

"The following values are for the appearance property and represent only
"those values listed in the W3C Candidate Recommendation or that are
"supported by both Webkit and Gecko browsers. 

syn match cssUIVal contained "\<\(button\|checkbox\|check-box-group\|
                              \combo-box\|desktop\|dialog\|document\|
                              \field\|hyperlink\|icon\|list-menu\|
                              \listbox\|menu\|menu-item\|menubar\|
                              \menulist\|menulist-button\|menulist-textfield\|
                              \outline-tree\|password\|pop-up-menu\|
                              \pull-down-menu\|push-button\|radio\|
                              \radio-button\|radio-group\|range\|
                              \scrollbarbutton-down\|scrollbarbutton-left\|
                              \scrollbarbutton-right\|scrollbarbutton-up\|
                              \scrollbartrack-horizontal\|scrollbartrack-vertical\|
                              \signature\|tab\|textfield\|tooltip\|window\|
                              \workspace\)\>"

"=D E F A U L T  H I G H L I G H T  G R O U P S`
"----------------------------------------------------------------------------"

hi def link cssComment Comment
hi def link cssTagName Statement
hi def link cssAttrSelectorOp Special
hi def link cssSelectorOp Special
hi def link cssFontProp StorageClass
hi def link cssColorProp StorageClass
hi def link cssTextProp StorageClass
hi def link cssBoxProp StorageClass
hi def link cssBgProp StorageClass
hi def link cssRenderProp StorageClass
hi def link cssSpeechProp StorageClass
hi def link cssRenderProp StorageClass
hi def link cssGenConProp StorageClass
hi def link cssPagingProp StorageClass
hi def link cssTableProp StorageClass
hi def link cssUIProp StorageClass
hi def link cssFontVal Type
hi def link cssColorVal Type
hi def link cssTextVal Type
hi def link cssBoxVal Type
hi def link cssRenderVal Type
hi def link cssSpeechVal Type
hi def link cssGenConVal Type
hi def link cssPageVal Type
hi def link cssTableVal Type
hi def link cssUIVal Type
hi def link cssSharedVal Type
hi def link cssPseudoClassId PreProc
hi def link cssPseudoClassLang Constant
hi def link cssUnitVal Number
hi def link cssNumVal Number
hi def link cssFuncVal Constant
hi def link cssFuncValName Function 
hi def link cssIdName Function
hi def link cssImportantVal Special
hi def link cssBraces Function
hi def link cssBraceError Error
hi def link cssQuo String
hi def link cssUnicodeVal Constant
hi def link cssClassName Function

let b:current_syntax = "css"

