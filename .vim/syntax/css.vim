"
" Vim syntax file
"
" Language:	CSS
" Maintainer:	Billy Whited (rocketspops@gmail.com)
" URL:		
" Last Change:  September 22nd, 2011

if exists("b:current_syntax")
  finish
endif

set iskeyword=@,48-57,@-@,-

syn sync fromstart

syn cluster Spell           contains=cssComment

"G L O B A L
"----------------------------------------------------------------------------

syn match cssBraceError     contained "{"
syn match cssBraceError     "}"

syn region cssComment       keepend
                          \ start="/\*"
                          \ end="\*/"

syn cluster cssCommon       contains=
                              \cssAbsLengthUnit,
                              \cssAttrExpr,
                              \cssCalcExpr,
                              \cssCycleExpr,
                              \cssImportant,
                              \cssNumber,
                              \cssPercentUnit,
                              \cssRelLengthUnit,
                              \cssValOp

syn region cssDecBlock      contains=@cssProp
                          \ containedin=cssAtRuleBlock
                          \ extend
                          \ keepend
                          \ matchgroup=cssBraces
                          \ start='{'
                          \ end='\(\(;\s*\)\@<=}\|^\s*}\)'
                          \ transparent

syn match cssImportant      contained "!\s*important\>"

syn match cssUnicode        contained
                          \ "\(U+[0-9A-Fa-f?]\+[+-][0-9A-Fa-f?]\+\|
                            \U+[0-9A-Fa-f?]\+\|\\\x\{1,6\}
                            \\(\w\|\s\w\)\@!\)"

syn match cssValOp          contained "[:;,/]"

"C S S 3  =ME D I A  Q U E R I E S                           W3C CR 7/27/2011
"----------------------------------------------------------------------------
"W3C Candidate Recommendation (27 Jul 2011)  www.w3.org/TR/css3-mediaqueries/
"----------------------------------------------------------------------------

syn region cssMediaExpr     contains=
                              \ cssCalcOp,
                              \ cssMediaFeature,
                              \ cssMediaValue,
                              \ cssNumber,
                              \ cssValOp
                          \ keepend
                          \ oneline
                          \ start="\s\@<=("
                          \ end=")"

syn keyword cssMediaFeature contained
                          \ aspect-ratio
                          \ color
                          \ color-index
                          \ device-aspect-ratio
                          \ device-height
                          \ device-width
                          \ grid
                          \ height
                          \ max-aspect-ratio
                          \ max-color
                          \ max-color-index
                          \ max-device-aspect-ratio
                          \ max-device-height
                          \ max-device-width
                          \ max-height
                          \ max-monochrome
                          \ max-resolution
                          \ max-width
                          \ min-aspect-ratio
                          \ min-color
                          \ min-color-index
                          \ min-device-aspect-ratio
                          \ min-device-height
                          \ min-device-width
                          \ min-height
                          \ min-monochrome
                          \ min-resolution
                          \ min-width
                          \ monochrome
                          \ orientation
                          \ resolution
                          \ scan
                          \ width

syn keyword cssMediaOp      and 

syn match cssMediaType     "\(@media\s\+\)\@<=
                            \all\|
                            \braille\|
                            \embossed\|
                            \handheld\|
                            \print\|
                            \projection\|
                            \screen\|
                            \speech\|
                            \tty\|
                            \tv"

syn match cssMediaValue     contained
                          \ "\<\(\:\s*\)\@<=\(
                            \landscape\|
                            \interlace\|
                            \portrait\|
                            \progressive\)\>"

"C S S 3  =S E L E C T O R S
"----------------------------------------------------------------------------
"W3C Proposed Recommendation (15 DEC 2009)      www.w3.org/TR/css3-selectors/
"----------------------------------------------------------------------------

"Attr Selectors ------------------------------------------------------------- 

syn region cssAttrSel       keepend
                          \ oneline
                          \ matchgroup=cssAttrSelExpr
                          \ start="\["
                          \ end="\]"

syn match cssAttrSelOp      contained "\([*~|$^]=\|=\)"

"Class Selectors ------------------------------------------------------------ 

syn match cssClassSel       "\.\(\\[0-9A-F]\{2}\s\|
                            \[^[:punct:][:space:][:cntrl:]]\|
                            \\\[[:print:]]\|
                            \\(\.\)\@<![\-_]\)\+"

"Combinators ----------------------------------------------------------------

syn match cssSelCombinator  "[+>~,]"

"Pseudo Class Selectors -----------------------------------------------------

syn match cssPseudoSel      "\(:active\|
                            \\(:\|::\)after\|
                            \\(:\|::\)before\|
                            \:checked\|
                            \:choices\|
                            \:default\|
                            \:disabled\|
                            \:empty\|
                            \:enabled\|
                            \:first-child\|
                            \\(:\|::\)first-letter\|
                            \\(:\|::\)first-line\|
                            \:first-of-type\|
                            \:first\|
                            \:focus\|
                            \:hover\|
                            \:in-range\|
                            \:indeterminate\|
                            \:invalid\|
                            \:last-child\|
                            \:last-of-type\|
                            \:left\|
                            \:link\|
                            \:marker\|
                            \:optional\|
                            \:only-child\|
                            \:only-of-type\|
                            \:out-of-range\|
                            \:read-only\|
                            \:read-write\|
                            \:repeat-index\|
                            \:repeat-item\|
                            \:required\|
                            \:right\|
                            \:root\|
                            \::selection\|
                            \::-moz-selection\|
                            \::-webkit-selection\|
                            \:target\|
                            \:value\|
                            \:valid\|
                            \:visited\)"

syn region cssPseudoExpr    keepend
                          \ matchgroup=cssPseudoExprType
                          \ oneline
                          \ start=
                              \"\(
                              \:lang\|
                              \:nth-child\|
                              \:nth-of-type\|
                              \:nth-last-of-type\|
                              \:nth-last-child\|
                              \:not
                              \\)("
                          \ end=")"

"ID Selectors ---------------------------------------------------------------

syn match cssIdSel          "\#\(\\[0-9A-F]\{2}\s\|
                            \[^[:punct:][:space:][:cntrl:]]\|
                            \\\[[:graph:]]\|
                            \\(\#\S*\)\@<=[\-_:.]\)\+"

"Namespace Selectors -------------------------------------------------------- 

syn match cssNamespaceSel   "\(\(^\|\(\S\)\@<!\*\|\[\|\a\+\|\s\+\)\@<=
                            \\(|\)\)\a\@="

"Type Selectors ------------------------------------------------------------- 

syn keyword cssTypeSel      a
                          \ abbr
                          \ acronym
                          \ address
                          \ applet
                          \ area
                          \ article
                          \ aside
                          \ audio
                          \ b
                          \ base
                          \ basefont
                          \ bdo
                          \ big
                          \ blockquote
                          \ body
                          \ br
                          \ button
                          \ canvas
                          \ caption
                          \ center
                          \ cite
                          \ code
                          \ col
                          \ colgroup
                          \ command
                          \ datalist
                          \ dd
                          \ del
                          \ details
                          \ dfn
                          \ dir
                          \ div
                          \ dl
                          \ dt
                          \ em
                          \ embed
                          \ fieldset
                          \ font
                          \ form
                          \ figcaption
                          \ figure
                          \ footer
                          \ frame
                          \ frameset
                          \ h1
                          \ h2
                          \ h3
                          \ h4
                          \ h5
                          \ h6
                          \ head
                          \ header
                          \ hgroup
                          \ hr
                          \ html
                          \ i
                          \ iframe
                          \ img
                          \ input
                          \ ins
                          \ isindex
                          \ kbd
                          \ keygen
                          \ label
                          \ legend
                          \ li
                          \ link
                          \ map
                          \ mark
                          \ menu
                          \ meta
                          \ meter
                          \ nav
                          \ noframes
                          \ noscript
                          \ object
                          \ ol
                          \ optgroup
                          \ option
                          \ output
                          \ p
                          \ param
                          \ pre
                          \ progress
                          \ q
                          \ rp
                          \ rt
                          \ ruby
                          \ s
                          \ samp
                          \ script
                          \ section
                          \ select
                          \ small
                          \ span
                          \ strike
                          \ strong
                          \ style
                          \ sub
                          \ summary
                          \ sup
                          \ table
                          \ tbody
                          \ td
                          \ textarea
                          \ tfoot
                          \ th
                          \ thead
                          \ time
                          \ title
                          \ tr
                          \ tt
                          \ ul
                          \ u
                          \ var
                          \ variant
                          \ video
                          \ xmp

"Universal Selectors -------------------------------------------------------- 

syn match cssUniversalSel   "\(\(^\|\a\+\|\s\+\)\@<=
                            \\(|\*\)\|
                            \\S\@<!\(\*|\*\|\*\)\)"


"=A T  R U L E  S E L E C T O R
"----------------------------------------------------------------------------

syn region cssAtRuleBlock   contains=
                              \cssDecBlock,
                              \cssBraceError,
                              \css.*Sel
                          \ keepend
                          \ matchgroup=cssAtRuleBraces
                          \ start="\(^@[A-Za-z].*\)\@<={"
                          \ end="}\|\(}\s*\)\@<={"
                          \ transparent

syn region cssAtRuleExpr    contains=cssString
                          \ keepend
                          \ oneline
                          \ start="\(url\)("
                          \ end=")"

syn keyword cssAtRule       @bottom-center
                          \ @bottom-left
                          \ @bottom-left-corner
                          \ @bottom-right
                          \ @bottom-right-corner
                          \ @charset
                          \ @color-profile
                          \ @document
                          \ @import
                          \ @left-top
                          \ @left-middle
                          \ @left-bottom
                          \ @media
                          \ @namespace
                          \ @page
                          \ @right-top
                          \ @right-middle
                          \ @right-bottom
                          \ @supports
                          \ @top-center
                          \ @top-left
                          \ @top-left-corner
                          \ @top-right
                          \ @top-right-corner

"=C S S 3  E X P R E S S I O N S
"----------------------------------------------------------------------------

syn region cssExpr          contained
                          \ contains=
                              \cssCalcOp,
                              \cssNumber,
                              \cssSelectOp,
                              \cssString
                          \ keepend
                          \ matchgroup=cssExprType
                          \ oneline
                          \ start=
                              \"\<\(
                              \clip\|
                              \counter\|
                              \cross-fade\|
                              \rect
                              \\)("
                          \ end="\()\)\(\s\+\|;\)\@="
                          \ transparent

"=C S S 3  V A L U E S  A N D  U N I T S  M O D U L E           
"----------------------------------------------------------------------------
"W3C Working Draft (6 SEP 2011)                    www.w3.org/TR/css3-values/ 
"----------------------------------------------------------------------------

"Distance Units ------------------------------------------------------------- 

syn match cssAbsLengthUnit  contained
                          \ "\(\d\)\@<=\(
                            \cm\|
                            \in\|
                            \mm\|
                            \pc\|
                            \pt\|
                            \px\)
                            \\(\;\|,\|/\|\s\+\)\@="

syn match cssRelLengthUnit  contained
                          \ "\(\d\)\@<=\(
                            \ch\|
                            \em\|
                            \ex\|
                            \rem\|
                            \vh\|
                            \vm\|
                            \vw\)
                            \\(\;\|,\|/\|\s\+\)\@="

"Functional Notations ------------------------------------------------------- 

syn region cssAttrExpr      contained
                          \ contains=cssValOp
                          \ keepend
                          \ matchgroup=cssAttrExprType
                          \ oneline
                          \ start="\<\(attr\)("
                          \ end="\()\)\(\s\+\|;\)\@="

syn region cssCalcExpr      contained
                          \ contains=
                              \cssAbsLengthUnit,
                              \cssAngleUnit,
                              \cssCalcOp,
                              \cssFreqUnit,
                              \cssNumber,
                              \cssRelLengthUnit,
                              \cssTimeUnit,
                              \cssValOp
                          \ keepend
                          \ matchgroup=cssCalcExprType
                          \ oneline
                          \ start=
                              \"\<\(
                              \calc\|
                              \max\|
                              \min
                              \\)("
                          \ end="\()\)\(\s\+\|;\)\@="
                          \ transparent

syn match cssCalcOp         contained "\([*+%/-]\)"

syn region cssCycleExpr     contained
                          \ contains=
                              \cssString,
                              \@cssVal,
                              \cssValOp
                          \ keepend
                          \ matchgroup=cssCycleExprType
                          \ oneline
                          \ start="\<\(cycle\)("
                          \ end="\()\)\(\s\+\|;\)\@="
                          \ transparent

"Numeric Data Types --------------------------------------------------------- 

syn match cssNumber         contained "[-+]\=\d\+\(\.\d*\)\="

syn match cssPercentUnit    contained 
                          \ "\(\d\)\@<=\(%\)\(\;\|,\|/\|\s\+\)\@="

"Other Units ---------------------------------------------------------------- 

syn match cssAngleUnit      contained
                          \ "\(\d\)\@<=\(
                            \deg\|
                            \grad\|
                            \rad\|
                            \rem\|
                            \turn\)
                            \\(\;\|,\|/\|\s\+\)\@="

syn match cssFracUnit       contained
                          \ "\(\d\)\@<=\(fr\)\(\;\|,\|/\|\s\+\)\@="

syn match cssFreqUnit       contained
                          \ "\(\d\)\@<=\(
                            \kHz\|
                            \Hz\)
                            \\(\;\|,\|/\|\s\+\)\@="

syn match cssGridUnit       contained
                          \ "\(\d\)\@<=\(gr\)\(\;\|,\|/\|\s\+\)\@="

syn match cssTimeUnit       contained
                          \ "\(\d\)\@<=\(
                            \ms\|
                            \s\)
                            \\(\;\|,\|/\|\s\+\)\@="

"Textual Data Types --------------------------------------------------------- 

syn region cssDataExpr      contained
                          \ contains=
                              \cssNumber,
                              \cssString
                          \ keepend
                          \ matchgroup=cssDataExprType
                          \ oneline
                          \ start=
                              \"\<\(
                              \url\|
                              \uri
                              \\)("
                          \ end="\()\)\(\s\+\|;\|\,\)\@="
                          \ transparent

syn region cssString           contained
                          \ keepend
                          \ start=+\'\|\"+
                          \ skip=+\\'\|\\"+
                          \ end=+\'\|\"+

"C S S 3  =B A C K G R O U N D  A N D  B O R D E R S  M O D U L E  
"----------------------------------------------------------------------------
"W3C Candidate Recommendation (15 FEB 2011)    www.w3.org/TR/css3-background/
"----------------------------------------------------------------------------

syn region cssBgBorProp     contained
                          \ contains=
                              \cssBgBorVal,
                              \cssColorExpr,
                              \cssColorHex,
                              \cssColorVal,
                              \@cssCommon,
                              \cssDataExpr,
                              \cssImgExpr
                          \ keepend
                          \ start=
                              \"\(\(^\|{\|\;\)\s*\)\@<=\(
                              \background\|
                              \background-attachment\|
                              \background-clip\|
                              \background-color\|
                              \background-image\|
                              \background-origin\|
                              \background-position\|
                              \background-repeat\|
                              \background-size\|
                              \border\|
                              \border-color\|
                              \border-style\|
                              \border-width\|
                              \border-bottom\|
                              \border-bottom-color\|
                              \border-bottom-style\|
                              \border-bottom-width\|
                              \border-left\|
                              \border-left-color\|
                              \border-left-style\|
                              \border-left-width\|
                              \border-right\|
                              \border-right-color\|
                              \border-right-style\|
                              \border-right-width\|
                              \border-top\|
                              \border-top-color\|
                              \border-top-style\|
                              \border-top-width\|
                              \border-image\|
                              \border-image-outset\|
                              \border-image-repeat\|
                              \border-image-slice\|
                              \border-image-source\|
                              \border-image-width\|
                              \border-radius\|
                              \border-radius-bottom-left\|
                              \border-radius-bottom-right\|
                              \border-radius-top-left\|
                              \border-radius-top-right\|
                              \box-decoration-break\|
                              \box-shadow
                              \\)\s*:"
                          \ end=";"

syn keyword cssBgBorVal     contained
                          \ auto
                          \ border-box
                          \ bottom
                          \ center
                          \ contain
                          \ content-box
                          \ cover
                          \ clone
                          \ currentColor
                          \ dashed
                          \ dotted
                          \ double
                          \ fill
                          \ fixed
                          \ groove
                          \ hidden
                          \ inset
                          \ left
                          \ local
                          \ medium
                          \ none
                          \ no-repeat
                          \ outset
                          \ padding-box
                          \ repeat
                          \ repeat-x
                          \ repeat-y
                          \ ridge
                          \ right
                          \ round
                          \ scroll
                          \ slice
                          \ solid
                          \ space
                          \ stretch
                          \ top

syn match cssBgBorVal       contained "\<transparent\>"

"C S S 3  B A S I C  =B O X  M O D E L  M O D U L E                         
"----------------------------------------------------------------------------
"W3C Working Draft (9 AUG 2007)                       www.w3.org/TR/css3-box/ 
"----------------------------------------------------------------------------

syn region cssBoxProp       contained
                          \ contains=
                              \cssBoxVal,
                              \cssAngleUnit,
                              \@cssCommon,
                              \cssGridUnit
                          \ keepend
                          \ start=
                              \"\(\(^\|{\|\;\)\s*\)\@<=\(
                              \clear\|
                              \display\|
                              \float\|
                              \height\|
                              \margin\|
                              \margin-bottom\|
                              \margin-left\|
                              \margin-right\|
                              \margin-top\|
                              \max-height\|
                              \max-width\|
                              \min-height\|
                              \min-width\|
                              \overflow\|
                              \overflow-x\|
                              \overflow-y\|
                              \padding\|
                              \padding-bottom\|
                              \padding-left\|
                              \padding-right\|
                              \padding-top\|
                              \rotation\|
                              \rotation-point\|
                              \visibility\|
                              \width\|
                              \z-index
                              \\)\s*:"
                          \ end=";"

syn keyword cssBoxVal       contained
                          \ alternate
                          \ auto
                          \ block
                          \ collapse
                          \ compact
                          \ hidden
                          \ inline
                          \ inline-block
                          \ inline-table
                          \ left
                          \ list-item
                          \ none
                          \ right
                          \ ruby
                          \ ruby-base
                          \ ruby-base-group
                          \ ruby-text
                          \ ruby-text-group
                          \ run-in
                          \ scroll
                          \ slide
                          \ table
                          \ table-caption
                          \ table-cell
                          \ table-column
                          \ table-column-group
                          \ table-footer-group
                          \ table-header-group
                          \ table-row
                          \ table-row-group
                          \ visible

"C S S 3  =C O L O R  M O D U L E                                
"----------------------------------------------------------------------------
"W3C Recommendation (7 JUN 2011)                    www.w3.org/TR/css3-color/
"----------------------------------------------------------------------------

syn region cssColorExpr     contained
                          \ contains=
                              \cssPercentUnit,
                              \cssNumber,
                              \cssString,
                              \cssValOp
                          \ keepend
                          \ matchgroup=cssColorExprType
                          \ oneline
                          \ start=
                              \"\<\(
                              \hsl\|
                              \hsla\|
                              \rgb\|
                              \rgba
                              \\)("
                          \ end="\()\)\(\s\+\|;\|\s*)\)\@="
                          \ transparent

syn match cssColorHex       contained 
                          \ "\(#[0-9A-Fa-f]\{6}\|
                            \#[0-9A-Fa-f]\{3}\)
                            \\(\s\+\|;\|\,\)\@="

syn region cssColorProp     contained
                          \ contains=cssColorVal,
                                    \cssColorExpr,
                                    \cssColorHex,
                                    \cssNumber,
                                    \cssPercentUnit,
                                    \cssValOp
                          \ keepend
                          \ start="\(\(^\|{\|\;\)\s*\)\@<=\(
                                  \color\|
                                  \currentColor\|
                                  \opacity
                                  \\)\s*:"
                          \ end=";"

syn match cssColorVal       contained "\<transparent\>"

syn keyword cssColorVal     contained
                          \ aliceblue
                          \ antiquewhite
                          \ aqua
                          \ aquamarine
                          \ azure
                          \
                          \ beige
                          \ bisque
                          \ black
                          \ blanchedalmond
                          \ blue
                          \ blueviolet
                          \ brown
                          \ burlywood
                          \
                          \ cadetblue
                          \ chartreuse
                          \ chocolate
                          \ coral
                          \ cornflowerblue
                          \ cornsilk
                          \ crimson
                          \ cyan
                          \
                          \ darkblue
                          \ darkcyan
                          \ darkgoldenrod
                          \ darkgray
                          \ darkgrey
                          \ darkgreen
                          \ darkkhaki
                          \ darkmagenta
                          \ darkolivegreen
                          \ darkorange
                          \ darkorchid
                          \ darkred
                          \ darksalmon
                          \ darkseagreen
                          \ darkslateblue
                          \ darkslategray
                          \ darkslategrey
                          \ darkturquoise
                          \ darkviolet
                          \ deeppink
                          \ deepskyblue
                          \ dimgray
                          \ dimgrey
                          \ dodgerblue
                          \
                          \ firebrick
                          \ floralwhite
                          \ forestgreen
                          \ fuchsia
                          \
                          \ gainsboro
                          \ ghostwhite
                          \ gold
                          \ goldenrod
                          \ gray
                          \ grey
                          \ green
                          \ greenyellow
                          \
                          \ honeydew
                          \ hotpink
                          \
                          \ indianred
                          \ indigo
                          \ ivory
                          \
                          \ khaki
                          \
                          \ lavender
                          \ lavenderblush
                          \ lawngreen
                          \ lemonchiffon
                          \ lightblue
                          \ lightcoral
                          \ lightcyan
                          \ lightgoldenrodyellow
                          \ lightgray
                          \ lightgrey
                          \ lightgreen
                          \ lightpink
                          \ lightsalmon
                          \ lightseagreen
                          \ lightskyblue
                          \ lightslategray
                          \ lightslategrey
                          \ lightsteelblue
                          \ lightyellow
                          \ lime
                          \ limegreen
                          \ linen
                          \
                          \ magenta
                          \ maroon
                          \ mediumaquamarine
                          \ mediumblue
                          \ mediumorchid
                          \ mediumpurple
                          \ mediumseagreen
                          \ mediumslateblue
                          \ mediumspringgreen
                          \ mediumturquoise
                          \ mediumvioletred
                          \ midnightblue
                          \ mintcream
                          \ mistyrose
                          \ moccasin
                          \
                          \ navajowhite
                          \ navy
                          \
                          \ oldlace
                          \ olive
                          \ olivedrab
                          \ orange
                          \ orangered
                          \ orchid
                          \
                          \ palegoldenrod
                          \ palegreen
                          \ paleturquoise
                          \ palevioletred
                          \ papayawhip
                          \ peachpuff
                          \ peru
                          \ pink
                          \ plum
                          \ powderblue
                          \ purple
                          \
                          \ red
                          \ rosybrown
                          \ royalblue
                          \
                          \ saddlebrown
                          \ salmon
                          \ sandybrown
                          \ seagreen
                          \ seashell
                          \ sienna
                          \ silver
                          \ skyblue
                          \ slateblue
                          \ slategray
                          \ slategrey
                          \ snow
                          \ springgreen
                          \ steelblue
                          \
                          \ tan
                          \ teal
                          \ thistle
                          \ tomato
                          \ turquoise
                          \
                          \ violet
                          \
                          \ wheat
                          \ white
                          \ whitesmoke
                          \
                          \ yellow
                          \ yellowgreen

"C S S 3  =F O N T S  M O D U L E                              
"----------------------------------------------------------------------------
"W3C Working Draft (24 MAR 2011)                    www.w3.org/TR/css3-fonts/
"----------------------------------------------------------------------------

syn region cssFontBlock     contains=cssFontProp
                          \ keepend
                          \ matchgroup=cssFontBraces
                          \ start="\(@font-face\s*\)\@<={"
                          \ end="}"
                          \ transparent

syn region cssFontExpr      contained
                          \ contains=
                              \cssNumber,
                              \cssString
                          \ keepend
                          \ matchgroup=cssFontExprType
                          \ oneline
                          \ start=
                              \"\<\(
                              \annotation\|
                              \character-variant\|
                              \format\|
                              \local\|
                              \ornaments\|
                              \stylistic\|
                              \styleset\|
                              \swash\|
                              \\)("
                          \ end="\()\)\(\s\+\|;\)\@="
                          \ transparent

syn keyword cssAtFontFace   @font-face

syn keyword cssFontName     contained
                          \ Arial
                          \ Calibri
                          \ Candara
                          \ Cambria
                          \ Consolas
                          \ Corbel
                          \ Constantia
                          \ Courier
                          \ Georgia
                          \ Helvetica
                          \ Lucida
                          \ Tahoma
                          \ Times
                          \ Verdana

syn region cssFontProp      contained
                          \ contains=@cssCommon,
                                    \cssDataExpr,
                                    \cssFontExpr,
                                    \cssFontName,
                                    \cssFontVal,
                                    \cssString,
                                    \cssUnicode
                          \ keepend
                          \ start="\(\(^\|{\|\;\)\s*\)\@<=\(
                                  \font\|
                                  \font-family\|
                                  \font-feature-settings\|
                                  \font-kerning\|
                                  \font-language-override\|
                                  \font-style\|
                                  \font-variant\|
                                  \font-variant-alternates\|
                                  \font-variant-caps\|
                                  \font-variant-east-asian\|
                                  \font-variant-ligatures\|
                                  \font-variant-numeric\|
                                  \font-weight\|
                                  \font-size\|
                                  \font-size-adjust\|
                                  \font-stretch\|
                                  \font-synthesis\|
                                  \src\|
                                  \unicode-range\|
                                  \vertical-position\|
                                  \\)\s*:"
                          \ end=";"

syn keyword cssFontVal      contained
                          \ additional-ligatures
                          \ all-petite-caps
                          \ all-small-caps
                          \ bold
                          \ bolder
                          \ caption
                          \ condensed
                          \ contextual
                          \ common-ligatures
                          \ cursive
                          \ diagonal-fractions
                          \ expanded
                          \ extra-condensed
                          \ extra-expanded
                          \ fantasy
                          \ font-feature-settings
                          \ font-language-ovveride
                          \ full-width
                          \ historical-forms
                          \ historical-ligatures
                          \ hojo-kanji
                          \ icon
                          \ inherit
                          \ italic
                          \ jis78
                          \ jis83
                          \ jis90
                          \ jis04
                          \ large
                          \ larger
                          \ lighter
                          \ lining-nums
                          \ menu
                          \ message-box
                          \ monospace
                          \ nlckanji
                          \ none
                          \ normal
                          \ no-additional-ligatures
                          \ no-contextual
                          \ no-common-ligatures
                          \ no-historical-ligatures
                          \ normal
                          \ oblique
                          \ oldstyle-nums
                          \ ordinal
                          \ petite-caps
                          \ proportional-nums
                          \ proportional-width
                          \ ruby
                          \ sans-serif
                          \ serif
                          \ semi-condensed
                          \ semi-expanded
                          \ simplified
                          \ slashed-zero
                          \ small
                          \ small-caps
                          \ small-caption
                          \ smaller
                          \ stacked-fractions
                          \ status-bar
                          \ subscript
                          \ superscript
                          \ tabular-nums
                          \ titling-caps
                          \ traditional
                          \ ultra-condensed
                          \ ultra-expanded
                          \ unicase
                          \ x-large
                          \ x-small
                          \ xx-large
                          \ xx-small

"C S S 3  =I M A G E  V A L U E S  M O D U L E                          
"----------------------------------------------------------------------------
"W3C Working Draft (8 SEP 2011)                    www.w3.org/TR/css3-images/
"----------------------------------------------------------------------------

syn region cssImgExpr       contained
                          \ contains=
                              \cssAngleUnit,
                              \cssColorExpr,
                              \cssColorHex,
                              \cssColorVal,
                              \@cssCommonUnit,
                              \cssImgVal,
                              \cssNumber,
                              \cssString,
                              \cssValOp
                          \ matchgroup=cssImgExprType
                          \ oneline
                          \ start=
                              \"\<\(
                              \element\|
                              \image\|
                              \linear-gradient\|
                              \radial-gradient\|
                              \repeating-linear-gradient\|
                              \repeating-radial-gradient\|
                              \\)("
                          \ end="\()\)\(\s\+\|;\|\s*)\)\@="
                          \ transparent

syn region cssImgProp       contained
                          \ contains=cssDataExpr,
                                    \cssNumber,
                                    \cssImgExpr,
                                    \cssImgResUnit,
                                    \cssImgVal,
                                    \cssValOp
                          \ keepend
                          \ start="\(\(^\|{\|\;\)\s*\)\@<=\(
                                  \image-orientation\|
                                  \image-rendering\|
                                  \image-resolution\|
                                  \object-fit\|
                                  \object-position
                                  \\)\s*:"
                          \ end=";"

syn match cssImgResUnit     contained
                          \ "\(\d\)\@<=\(
                            \dpi\|
                            \dpcm\|
                            \dppx\)
                            \\(\;\|,\|)\|\s\+\)\@="

syn keyword cssImgVal       contained
                          \ bottom
                          \ center
                          \ circle
                          \ closest-corner
                          \ closest-side
                          \ contain
                          \ cover
                          \ crisp-rendering
                          \ ellipse
                          \ farthest-corner
                          \ farthest-side
                          \ fill
                          \ from-image
                          \ left
                          \ none
                          \ right
                          \ scale-down
                          \ snap
                          \ top

syn match cssImgVal         contained
                          \ "to\(\s\(bottom\|left\|right\|top\)\)\@=" 

"C S S 2.1  =G E N E R A T E D  C O N T E N T                  W3C R 6/7/2011
"----------------------------------------------------------------------------

syn match cssGenConProp     contained "\<\quotes\>"

syn keyword cssGenConProp   contained
                          \ content
                          \ counter-reset
                          \ counter-increment
                          \ list-style
                          \ list-style-type
                          \ list-style-image
                          \ list-style-position

syn match cssGenConVal      contained
                          \ "\<\(armenian\|
                            \cjk-ideographic\|
                            \decimal\(-leading-zero\)\|
                            \disc\|
                            \georgian\|
                            \hebrew\|
                            \\(hiragana\|katakana\)\(-iroha\)\=\|
                            \inside\|
                            \\(lower\|upper\)-\(roman\|alpha\|greek\|latin\)\|
                            \\(no-\)\=\(open\|close\)-quote\|
                            \outside\|
                            \square\)\>"


"C S S 3  =M A R Q U E E  M O D U L E                        W3C CR 12/5/2008
"----------------------------------------------------------------------------

syn region cssMarqProp      contained
                          \ contains=cssMarqVal,
                                    \cssMarqNumVal,
                                    \cssValOp
                          \ keepend
                          \ start="\(\(^\|{\|\;\)\s*\)\@<=\(
                                  \marquee-direction\|
                                  \marquee-play-count\|
                                  \marquee-speed\|
                                  \marquee-style\|
                                  \overflow-style
                                  \\)\s*:"
                          \ end=";"
                            
syn keyword cssMarqVal      contained
                          \ alternate
                          \ fast
                          \ forward
                          \ infinite
                          \ marquee-block
                          \ marquee-line
                          \ normal
                          \ reverse
                          \ scroll
                          \ slide
                          \ slow

syn match cssMarqNumVal     contained 
                            \"\(-\|\w\)\@<!
                            \\([0-9]\{1,2}\)
                            \\(\s\+\|;\|\,\)\@="

"C S S 3  =MU L T I - C O L U M N  L A Y O U T  M O D U L E  W3C CR 3/12/2011
"----------------------------------------------------------------------------

syn keyword cssMultiColProp contained
                          \ break-after
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

syn match cssMultiColVal    contained
                          \ "\<\(all\|
                            \avoid-page\|
                            \avoid-column\|
                            \balance\)\>"

"C S S 3  =P A G E D  M E D I A  M O D U L E                   W3C WD 6/7/2011
"----------------------------------------------------------------------------

syn keyword cssPageProp     contained
                          \ fit
                          \ fit-position
                          \ inside
                          \ marks
                          \ orphans
                          \ page
                          \ page-break-before
                          \ page-break-after
                          \ page-break-inside
                          \ size
                          \ widows

syn match cssPageVal        contained
                          \ "\<\(A5\|
                            \A4\|
                            \A3\|
                            \B5\|
                            \B4\|
                            \crop\|
                            \cross\|
                            \fill\|
                            \landscape\|
                            \ledger\|
                            \legal\|
                            \letter\|
                            \meet\|
                            \portrait\)\>"

"=R E N D E R  P R O P S + V A L U E S
"----------------------------------------------------------------------------

syn keyword cssRenderProp   contained
                          \ bottom
                          \ left
                          \ marker-offset
                          \ position
                          \ right
                          \ top

syn match cssRenderVal      contained
                          \ "\<\(
                            \bidi-override\|
                            \embed\|
                            \fixed\|
                            \marker\|
                            \relative\|
                            \static\|
                            \\)\>"

"C S S 3  =R U B Y  M O D U L E                              W3C WD 6/30/2011
"----------------------------------------------------------------------------

syn keyword cssRubyProp     contained
                          \ ruby-align
                          \ ruby-overhang
                          \ ruby-position
                          \ ruby-span

syn match cssRubyVal        contained
                          \ "\<\(distribute-letter\|
                            \distribute-space\|
                            \line-edge\)\>"


"C S S 3  =S P E E C H  M O D U L E                          W3C WD 8/18/2011
"----------------------------------------------------------------------------

syn keyword cssSpeechProp   contained
                          \ cue
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

syn match cssSpeechVal      contained
                          \ "\<\(child\|
                            \code\|
                            \continuous\|
                            \faster\|
                            \female\|
                            \high\|
                            \literal-punctuation\|
                            \leftwards\|
                            \loud\|
                            \low\|
                            \lower\|
                            \male\|
                            \mix\|
                            \moderate\|
                            \neutral\|
                            \no-punctuation\|
                            \normal\|
                            \old\|
                            \rightwards\|
                            \silent\|
                            \slower\|
                            \soft\|
                            \spell-out\|
                            \
                            \\(x-\)\=\(fast\|high\|loud\|low\|reduced\|soft\|
                            \strong\|young\|weak\)\)\>"

"=T A B L E  P R O P S + V A L U E S
"----------------------------------------------------------------------------

syn keyword cssTableProp    contained
                          \ border-collapse
                          \ border-spacing
                          \ caption-side
                          \ empty-cells
                          \ speak-header
                          \ table-layout

syn match cssTableVal       contained
                          \ "\<\(fixed\|
                            \separate\|
                            \show\|
                            \hide\|
                            \once\)\>"

"C S S 3  =TE X T  M O D U L E                               W3C WD 9/01/2011
"----------------------------------------------------------------------------

syn keyword cssTextProp     contained
                          \ baseline-shift
                          \ hanging-punctuation
                          \ hyphens
                          \ hyphenate-character
                          \ hyphenate-limit-chars
                          \ hyphenate-limit-lines
                          \ hyphentate-limit-last
                          \ hyphenate-limit-zone
                          \ line-break
                          \ letter-spacing
                          \ line-height
                          \ overflow-wrap
                          \ tab-size
                          \ text-align
                          \ text-align-last
                          \ text-decoration
                          \ text-decoration-color
                          \ text-decoration-skip
                          \ text-decoration-style
                          \ text-emphasis
                          \ text-emphasis-color
                          \ text-emphasis-position
                          \ text-emphasis-skip
                          \ text-emphasis-style
                          \ text-indent
                          \ text-justify
                          \ text-rendering
                          \ text-shadow
                          \ text-spacing
                          \ text-space-collapse
                          \ text-transform
                          \ text-underline-position
                          \ text-wrap
                          \ vertical-align
                          \ white-space
                          \ word-break
                          \ word-spacing

syn match cssTextVal        contained
                          \ "\<\(allow-end\|
                            \alphabetic\|
                            \baseline\|
                            \below-left\|
                            \below-right\|
                            \blink\|
                            \break-all\|
                            \break-word\|
                            \capitalize\|
                            \center\|
                            \consume-after\|
                            \consume-before\|
                            \discard\|
                            \distribute\|
                            \double-circle\|
                            \dot\|
                            \each-line\|
                            \edges\|
                            \filled\|
                            \first\|
                            \force-end\|
                            \full-width\|
                            \full-size-kana\|
                            \hanging\|
                            \hyphenate\|
                            \ideograph-alpha\|
                            \ideograph-numeric\|
                            \ink\|
                            \inter-cluster\|
                            \inter-ideograph\|
                            \inter-word\|
                            \justify\|
                            \kashida\|
                            \keep-all\|
                            \line-through\|
                            \lowercase\|
                            \loose\|
                            \manual\|
                            \match-parent\|
                            \middle\|
                            \narrow\|
                            \no-compress\|
                            \no-line-through\|
                            \no-overline\|
                            \no-underline\|
                            \nowrap\|
                            \objects\|
                            \open\|
                            \optimizeLegibility\|
                            \overline\|
                            \pre\|
                            \pre-wrap\|
                            \pre-line\|
                            \preserve-breaks\|
                            \punctuation\|
                            \remove-all\|
                            \replace-line-through\|
                            \replace-overline\|
                            \replace-underline\|
                            \sesame\|
                            \spaces\|
                            \space-adjacent\|
                            \space-start\|
                            \space-end\|
                            \spread\|
                            \strict\|
                            \sub\|
                            \super\|
                            \symbols\|
                            \text-bottom\|
                            \text-top\|
                            \triangle\|
                            \trim-adjacent\|
                            \trim-start\|
                            \trim-end\|
                            \trim-inner\|
                            \underline\|
                            \uppercase\|
                            \wavy\)\>"

"C S S 3  =BA S I C  U I  M O D U L E                        W3C CR 5/11/2004
"----------------------------------------------------------------------------

syn keyword cssUIProp       contained
                          \ appearance
                          \ box-sizing
                          \ cursor
                          \ icon
                          \ nav-index
                          \ nav-up
                          \ nav-right
                          \ nav-down
                          \ nav-left
                          \ outline
                          \ outline-color
                          \ outline-offset
                          \ outline-style
                          \ outline-width
                          \ resize

syn match cssUIVal          contained
                          \ "\<\(alias\|
                            \all-scroll\|
                            \both\|
                            \cell\|
                            \context-menu\|
                            \col-resize\|
                            \copy\|
                            \crosshair\|
                            \ew-resize\|
                            \help\|
                            \horizontal\|
                            \move\|
                            \nesw-resize\|
                            \no-drop\|
                            \not-allowed\|
                            \\([ns]\=[ew]\=-resize\)\|
                            \ns-resize\|
                            \nwse-resize
                            \pointer\|
                            \progress\|
                            \row-resize\|
                            \text\|
                            \vertical\|
                            \vertical-text\|
                            \wait\)\>"

"The following values are for the appearance property and represent only
"those values listed in the W3C Candidate Recommendation or that are
"supported by both Webkit and Gecko browsers.

syn match cssUIVal          contained
                          \ "\<\(button\|
                            \checkbox\|
                            \check-box-group\|
                            \combo-box\|
                            \desktop\|
                            \dialog\|
                            \document\|
                            \field\|
                            \hyperlink\|
                            \icon\|
                            \list-menu\|
                            \listbox\|
                            \menu\|
                            \menu-item\|
                            \menubar\|
                            \menulist\|
                            \menulist-button\|
                            \menulist-textfield\|
                            \outline-tree\|
                            \password\|
                            \pop-up-menu\|
                            \pull-down-menu\|
                            \push-button\|
                            \radio\|
                            \radio-button\|
                            \radio-group\|
                            \range\|
                            \scrollbarbutton-down\|
                            \scrollbarbutton-left\|
                            \scrollbarbutton-right\|
                            \scrollbarbutton-up\|
                            \scrollbartrack-horizontal\|
                            \scrollbartrack-vertical\|
                            \signature\|
                            \tab\|
                            \textfield\|
                            \tooltip\|
                            \window\|
                            \workspace\)\>"

"=C S S 3  =W R I T I N G  M O D E S  M O D U L E             W3C WD 9/1/2011
"----------------------------------------------------------------------------

syn keyword cssWritingProp  contained
                          \ caption-side
                          \ direction
                          \ text-combine-horizontal
                          \ text-combine-mode
                          \ text-orientation
                          \ unicode-bidi
                          \ writing-mode

syn match cssWritingVal     contained
                          \ "\<\(alpha\|
                            \alphanumeric\|
                            \ascii-digits\|
                            \bidi-override\|
                            \compress\|
                            \embed\|
                            \horizontal-tb\|
                            \vertical-lr\|
                            \vertical-rl\|
                            \latin\|
                            \ltr\|
                            \no-compress\|
                            \plaintext\|
                            \rtl\|
                            \sideways\|
                            \sideways-left\|
                            \sideways-right\|
                            \upright\|
                            \upright-right\|
                            \use-glyphs\|
                            \use-glyph-orientation\)\>"

syn cluster cssProp        contains=css.*Prop

syn cluster cssVal         contains=css.*Val

"=D E F A U L T  H I G H L I G H T  G R O U P S`
"----------------------------------------------------------------------------

hi def link cssAtRule        boolean

hi def link cssAbsLengthUnit Character
hi def link cssAngleUnit     Character
hi def link cssFracUnit      Character
hi def link cssFreqUnit      Character
hi def link cssGridUnit      Character
hi def link cssImgResUnit    Character
hi def link cssPercentUnit   Character
hi def link cssRelLengthUnit Character
hi def link cssTimeUnit      Character

hi def link cssComment      Comment

hi def link cssAtFontFace     Conditional
hi def link cssAtRule         Conditional
hi def link cssAttrSelExpr    Conditional
hi def link cssPseudoExprType Conditional
hi def link cssPseudoSel      Conditional

hi def link cssAttrExpr     Constant
hi def link cssBgBorVal     Constant
hi def link cssBoxVal       Constant
hi def link cssColorVal     Constant
hi def link cssFontName     Constant
hi def link cssFontVal      Constant
hi def link cssImgVal       Constant
hi def link cssGenConVal    Constant
hi def link cssMarqVal      Constant
hi def link cssMediaValue   Constant
hi def link cssMultiColVal  Constant
hi def link cssPageVal      Constant
hi def link cssRenderVal    Constant
hi def link cssRubyVal      Constant
hi def link cssSharedVal    Constant
hi def link cssSpeechVal    Constant
hi def link cssTableVal     Constant
hi def link cssTextVal      Constant
hi def link cssUIVal        Constant
hi def link cssWritingVal   Constant

hi def link cssBraceError   Error

hi def link cssAtRuleBraces   Function
hi def link cssAtRuleExpr     Function
hi def link cssAttrExprType   Function
hi def link cssBraces         Function
hi def link cssCalcExprType   Function
hi def link cssColorExprType  Function
hi def link cssCycleExprType  Function
hi def link cssDataExprType   Function
hi def link cssFontExprType   Function
hi def link cssFontBraces     Function
hi def link cssExprType       Function
hi def link cssImgExprType    Function
hi def link cssMediaExpr      Function

hi def link cssAttrSel      Identifier
hi def link cssClassSel     Identifier
hi def link cssIdSel        Identifier
hi def link cssMediaType    Identifier
hi def link cssPseudoExpr   Identifier

hi def link cssColorHex     Number
hi def link cssNumber       Number
hi def link cssMarqNumVal   Number
hi def link cssUnicode      Number

hi def link cssAttrSelOp     Operator
hi def link cssCalcOp        Operator
hi def link cssMediaOp       Operator
hi def link cssNamespaceSel  Operator
hi def link cssSelCombinator Operator
hi def link cssUniversalSel  Operator
hi def link cssValOp         Operator

hi def link cssImportant    Special

hi def link cssString       String

hi def link cssTypeSel      Tag

hi def link cssBgBorProp    Type
hi def link cssBoxProp      Type
hi def link cssColorProp    Type
hi def link cssFontProp     Type
hi def link cssImgProp      Type
hi def link cssGenConProp   Type
hi def link cssMarqProp     Type
hi def link cssMediaFeature Type
hi def link cssMultiColProp Type
hi def link cssPageProp     Type
hi def link cssRenderProp   Type
hi def link cssRubyProp     Type
hi def link cssSpeechProp   Type
hi def link cssTableProp    Type
hi def link cssTextProp     Type
hi def link cssUIProp       Type
hi def link cssWritingProp  Type

let b:current_syntax = "css"
