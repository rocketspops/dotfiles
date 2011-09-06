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

syn region cssComment       keepend 
                          \ start="/\*" 
                          \ end="\*/" 

syn region cssQuo           keepend 
                          \ start=+\'\|\"+ 
                          \ skip=+\\'\|\\"+ 
                          \ end=+\'\|\"+ 

"=B A S I C  S E L E C T O R S
"----------------------------------------------------------------------------"

syn match cssSelectOp       "[*+>.,_|~-]"
syn match cssAttrSelectOp   "[=*~|$^]"

syn match cssCalcOp         contained 
                            \ "\([+-/*]\)\=\|\(mod\)"

syn match cssIdName         "#[A-Za-z_][A-Za-z0-9_-]*"
syn match cssClassName      "\.[A-Za-z][A-Za-z0-9_-]*"

syn keyword cssTagName      a 
                          \ abbr 
                          \ acronym 
                          \ address 
                          \ applet 
                          \ area 
                          \ article 
                          \ aside
                          \ audio
                          \
                          \ b 
                          \ base 
                          \ basefont 
                          \ bdo 
                          \ big 
                          \ blockquote 
                          \ body 
                          \ br 
                          \ button 
                          \
                          \ canvas 
                          \ caption 
                          \ center 
                          \ cite 
                          \ code 
                          \ col 
                          \ colgroup
                          \ command 
                          \
                          \ datalist 
                          \ dd 
                          \ del 
                          \ details 
                          \ dfn 
                          \ dir 
                          \ div 
                          \ dl 
                          \ dt 
                          \
                          \ em 
                          \ embed 
                          \
                          \ fieldset 
                          \ font 
                          \ form 
                          \ figcaption 
                          \ figure 
                          \ footer 
                          \ frame 
                          \ frameset 
                          \
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
                          \
                          \ i 
                          \ iframe 
                          \ img 
                          \ input
                          \ ins 
                          \ isindex 
                          \
                          \ kbd 
                          \ keygen 
                          \
                          \ label 
                          \ legend 
                          \ li 
                          \ link 
                          \
                          \ map 
                          \ mark 
                          \ menu 
                          \ meta 
                          \ meter 
                          \
                          \ nav 
                          \ noframes 
                          \ noscript 
                          \
                          \ object 
                          \ ol 
                          \ optgroup 
                          \ option 
                          \ output 
                          \
                          \ p 
                          \ param 
                          \ pre 
                          \ progress 
                          \
                          \ q 
                          \
                          \ rp 
                          \ rt 
                          \ ruby 
                          \
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
                          \
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
                          \
                          \ ul 
                          \ u 
                          \ 
                          \ var 
                          \ variant 
                          \ video 
                          \
                          \ xmp 

syn region cssAttrSelect    contains=cssAttrSelectOp,cssQuo
                          \ matchgroup=cssAttrSelect 
                          \ start="\[" 
                          \ end="]" 
                          \ transparent 

"=P S E U D O  C L A S S  S E L E C T O R S 
"----------------------------------------------------------------------------"

syn match cssPseudoClass    "\(:active\| 
                            \:after\| 
                            \:before\|
                            \:checked\|
                            \:choices\|
                            \:default\|
                            \:disabled\|
                            \:empty\|
                            \:enabled\|
                            \:first\|
                            \:first-child\|
                            \:first-letter\|
                            \:first-line\|
                            \:first-of-type\|
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
                            \:target\|
                            \:value\|
                            \:valid\|
                            \:visited\)"

syn region cssPseudoClass   contains=cssNumVal,cssUnitVal,cssSelectOp
                          \ keepend
                          \ matchgroup=cssPseudoClassExpr 
                          \ oneline
                          \ start="\(:lang\|
                                   \:nth-child\|
                                   \:nth-of-type\|
                                   \:nth-last-of-type\|
                                   \:nth-last-child\|
                                   \:not\)(" 
                          \ end=")" 

"=A T  R U L E  S E L E C T O R 
"----------------------------------------------------------------------------"

syn region cssAtRuleUrl     contains=cssQuo
                          \ keepend 
                          \ oneline
                          \ start="url(" 
                          \ end=")"

syn keyword cssAtRule       @bottom-center
                          \ @bottom-left
                          \ @bottom-left-corner
                          \ @bottom-right
                          \ @bottom-right-corner
                          \ @charset 
                          \ @color-profile
                          \ @document
                          \ @font-face 
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

syn keyword cssMediaType    all
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

syn region cssDecBlock      contains=cssProp,cssVal,cssBraceError
                          \ keepend
                          \ matchgroup=cssBraces 
                          \ start='{' 
                          \ end='}'
                          \ transparent

syn region cssProp          contained
                          \ contains=@cssPropGroup
                          \ keepend
                          \ start="\(^\|\(\;\s*\)\@<=\w\|\({\s*\)\@<=\w\)" 
                          \ end="\w\(\:\)\@="
                          \ oneline

syn region cssVal           contained
                          \ contains=@cssValGroup
                          \ keepend
                          \ matchgroup=cssValPunc 
                          \ start="\:" 
                          \ end="\;" 

syn cluster cssValGroup     contains=css.*Val,css.*Quo
syn cluster cssPropGroup    contains=css.*Prop

syn match cssBraceError     contained "{"
syn match cssBraceError     "}"

"=G L O B A L  P R O P S + V A L U E S
"----------------------------------------------------------------------------"

syn region cssFuncVal       contained 
                            \ contains=cssQuo,
                                      \cssSelectOp,
                                      \cssCalcOp,
                                      \cssNumVal
                            \ keepend 
                            \ matchgroup=cssFuncValName
                            \ oneline 
                            \ start="\<\(annotation\|
                                     \attr\|
                                     \calc\|
                                     \clip\|
                                     \character-variant\|
                                     \counter\|format\|
                                     \cross-fade\|
                                     \element\|
                                     \hsl\|
                                     \hsla\|
                                     \image\|
                                     \linear-gradient\|
                                     \local\|
                                     \max\|
                                     \min\|
                                     \ornaments\|
                                     \radial-gradient\|
                                     \repeating-linear-gradient\|
                                     \repeating-radial-gradient\|
                                     \rect\|
                                     \rgb\|
                                     \rgba\|
                                     \stylistic\|
                                     \styleset\|
                                     \swash\|
                                     \uri\|
                                     \url\)(" 
                            \ end=")"
                            \ transparent 

syn match cssImportantVal   contained "!\s*important\>"

syn match cssSharedVal      contained 
                          \ "\<\(above\|
                            \absolute\|
                            \after\|
                            \always\|
                            \auto\|
                            \avoid\|
                            \before\|
                            \border-box\|
                            \bottom\|
                            \center\|
                            \circle\|
                            \collapse\|
                            \column\|
                            \content-box\|
                            \digits\|
                            \end\|
                            \fast\|
                            \fill-available\|
                            \fit-content\|
                            \hidden\|
                            \inline\|
                            \intial\|
                            \left\|
                            \inherit\|
                            \none\|
                            \normal\|
                            \max-content\|
                            \min-content\|
                            \medium\|
                            \padding-box\|
                            \page\|
                            \preserve\|
                            \right\|
                            \scroll\|
                            \slice\|
                            \slow\
                            \start\|
                            \top\)\>"

syn match cssUnicodeVal     contained 
                          \ "\(U+[0-9A-Fa-f?]\+[+-][0-9A-Fa-f?]\+\|
                            \U+[0-9A-Fa-f?]\+\|\\\x\{1,6\}\(\w\|
                            \\s\w\)\@!\)"

syn match cssNumVal         contained "[-]\=\d\+\(\.\d*\)\="

syn match cssUnitVal        contained 
                          \ "\(\d\)\@<=\(
                            \%\|
                            \ch\|
                            \cm\|
                            \deg\|
                            \dpi\|
                            \dpcm\|
                            \dppx\|
                            \em\|
                            \ex\|
                            \fr\|
                            \gr\|
                            \grad\|
                            \kHz\|
                            \Hz\|
                            \in\|
                            \mm\|
                            \ms\|
                            \pc\|
                            \pt\|
                            \px\|
                            \rad\|
                            \rem\|
                            \s\|
                            \turn\|
                            \vh\|
                            \vm\|
                            \vw\)"

"=B A C K G R O U N D  and  B O R D E R S  M O D U L E       W3C CR 2/15/2011
"----------------------------------------------------------------------------"

syn match cssBgProp         contained 
                          \ "\<\(border\
                            \(-\(top\|right\|bottom\|left\)\)\=
                            \\(-\(color\|style\|width\)\)\=\)\>"

syn keyword cssBgProp       contained 
                          \ background
                          \ background-attachment
                          \ background-clip
                          \ background-color
                          \ background-image
                          \ background-origin
                          \ background-position
                          \ background-repeat
                          \ background-size
                          \ border-image
                          \ border-image-outset
                          \ border-image-repeat
                          \ border-image-slice
                          \ border-image-source
                          \ border-image-width
                          \ border-radius
                          \ border-radius-bottom-left
                          \ border-radius-bottom-right
                          \ border-radius-top-left
                          \ border-radius-top-right
                          \ box-decoration-break
                          \ box-shadow

syn match cssBgVal          contained 
                          \ "\<\(center\|
                            \contain\|
                            \cover\|
                            \clone\|
                            \fixed\|
                            \no-repeat\|
                            \repeat-x\|
                            \repeat-y\|
                            \round\|
                            \space\)\>"

"=BO X  P R O P S + V A L U E S
"----------------------------------------------------------------------------"

syn keyword cssBoxProp      contained 
                          \ clear 
                          \ clip
                          \ float 
                          \ height 
                          \ margin
                          \ margin-bottom
                          \ margin-left
                          \ margin-right
                          \ margin-top
                          \ max-height
                          \ max-width
                          \ min-height
                          \ min-width
                          \ overflow
                          \ overflow-x
                          \ overflow-y
                          \ padding
                          \ padding-bottom
                          \ padding-left
                          \ padding-right
                          \ padding-top
                          \ visibility
                          \ width
                          \ z-index

syn match cssBoxVal         contained 
                          \ "\<\(dashed\|
                            \dotted\|
                            \double\|
                            \fill\|
                            \groove\|
                            \inset\|
                            \invert\|
                            \outset\|
                            \outset\|
                            \ridge\|
                            \scroll\|
                            \solid\|
                            \stretch\|
                            \thick\|
                            \thin\|
                            \visible\)\>"

"C S S 3  =C O L O R  M O D U L E                              W3C R 6/7/2011 
"----------------------------------------------------------------------------"

syn keyword cssColorProp    contained 
                          \ color 
                          \ currentColor 
                          \ opacity

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

syn match cssColorVal       contained "\<transparent\>"
syn match cssColorVal       contained "#[0-9A-Fa-f]\{3}"
syn match cssColorVal       contained "#[0-9A-Fa-f]\{6}"

"=F O N T  P R O P S + V A L U E S
"----------------------------------------------------------------------------"

syn keyword cssFontProp     contained 
                          \ font
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

syn match cssFontVal        contained 
                          \ "\<\(Arial\|
                            \Calibri\|
                            \Candara\|
                            \Cambria\|
                            \Consolas\|
                            \Corbel\|
                            \Constantia\|
                            \Courier\|
                            \Georgia\|
                            \Helvetica\|
                            \Lucida\|
                            \Tahoma\|
                            \Times\|
                            \Verdana\)\>" 

syn match cssFontVal        contained 
                          \ "\<\(additional-ligatures\|
                            \all-petite-caps\|
                            \all-small-caps\|
                            \bold\|
                            \bolder\|
                            \caption\|
                            \contextual\|
                            \common-ligatures\|
                            \cursive\|
                            \diagonal-fractions\|
                            \fantasy\|
                            \full-width\|
                            \historical-forms\|
                            \historical-ligatures\|
                            \hojo-kanji\|
                            \icon\|
                            \italic\|
                            \jis78\|
                            \jis83\|
                            \jis90\|
                            \jis04\|
                            \large\|
                            \larger\|
                            \lighter\|
                            \lining-nums\|
                            \menu\|
                            \message-box\|
                            \monospace\|
                            \nlckanji\|
                            \no-additional-ligatures\|
                            \no-contextual\|
                            \no-common-ligatures\|
                            \no-historical-ligatures\|
                            \normal\|
                            \oblique\|
                            \oldstyle-nums\|
                            \ordinal\|
                            \petite-caps\|
                            \proportional-nums\|
                            \proportional-width\| 
                            \ruby\|
                            \sans-serif\|
                            \serif\|
                            \simplified\|
                            \slashed-zero\|
                            \small\|
                            \small-caps\|
                            \small-caption\|
                            \smaller\|
                            \stacked-fractions\|
                            \status-bar\|
                            \subscript\|
                            \superscript\|
                            \tabular-nums\|
                            \titling-caps\|
                            \traditional\|
                            \
                            \unicase\|\(\(ultra\|extra\|semi\)-\)\=
                            \\(condensed\|expanded\)\|
                            \x-large\|x-small\|xx-large\|xx-small\)\>"


"C S S 3  =I M A G E S  M O D U L E                          W3C WD 7/12/2011
"----------------------------------------------------------------------------"

syn keyword cssImgProp      contained
                          \ image-orientation
                          \ image-rendering
                          \ image-resolution
                          \ object-fit
                          \ object-position

syn match cssImgVal         contained
                          \ "\<\(contain\|
                            \cover\|
                            \crisp-rendering\|
                            \fill\|
                            \from-image\|
                            \scale-down\)\>"

"C S S 2.1  =G E N E R A T E D  C O N T E N T                  W3C R 6/7/2011
"----------------------------------------------------------------------------"

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
"----------------------------------------------------------------------------"

syn keyword cssMarqProp     contained 
                          \ marquee-direction
                          \ marquee-play-count
                          \ marquee-speed
                          \ marquee-style
                          \ overflow-style

syn match cssMarqValue      contained 
                          \ "\<\(alternate\|
                            \forward\|
                            \marquee-block\|
                            \marquee-line\|
                            \slide\|
                            \reverse\)\>"

"C S S 3  =MU L T I - C O L U M N  L A Y O U T  M O D U L E  W3C CR 3/12/2011
"----------------------------------------------------------------------------"

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
"----------------------------------------------------------------------------"

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
"----------------------------------------------------------------------------"

syn keyword cssRenderProp   contained 
                          \ bottom 
                          \ display 
                          \ left 
                          \ marker-offset 
                          \ position 
                          \ right 
                          \ top 

syn match cssRenderVal      contained 
                          \ "\<\(block\|
                            \bidi-override\|
                            \compact\|
                            \embed\|
                            \fixed\|
                            \inline-block\|
                            \inline-table\|
                            \list-item\|
                            \marker\|
                            \relative\|
                            \run-in\|
                            \static\|
                            \
                            \table\(-\(row-group\|\(header\|footer\)
                            \-group\|row\|column\(-group\)\=\|
                            \cell\|caption\)\)\=\)\>" 

"C S S 3  =R U B Y  M O D U L E                              W3C WD 6/30/2011
"----------------------------------------------------------------------------"

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
"----------------------------------------------------------------------------"

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
"----------------------------------------------------------------------------"

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
"----------------------------------------------------------------------------"

syn keyword cssTextProp     contained 
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
"----------------------------------------------------------------------------"

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
"----------------------------------------------------------------------------"

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

"=D E F A U L T  H I G H L I G H T  G R O U P S`
"----------------------------------------------------------------------------"

hi def link cssComment Comment
hi def link cssTagName Statement
hi def link cssAttrSelectOp Special
hi def link cssSelectOp Special
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
hi def link cssPseudoClass PreProc
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

