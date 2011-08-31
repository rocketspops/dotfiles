" 
"                 ``......``               
"           `-://:----.--:///:-`          
"        `:++:..````....```..-:/+:`       
"      .+s/-...-/+ooossoo+/:....-/o+.     
"     /yo-../+syyyyhhhhhyyysyo/-.-:+s/    
"   `oy+-.:oyhhhhyyyyyyyyyyyyyys/.--+so`  
"   +y/-`:syhhhhs````````````hys+-.-+yo`  
"  :yo:./syhhhhhhhhhho  yhhhhhhhhy+.-:sy: 
" `sy/.-syhhhddddddhho  hhhhhhhhhys/.-+ys 
" .yy:./syhhhdddddddho  hhddddhhhhyo.:/yy`
" .yy:./syhhhdddddddho  hhdddddhhhyo.-/hy`
" `sh/.-syhhhddddddhho  hhdddddhhhs+.:+ys 
"  /ys-.+shhhhhhdddhho  hhhdddhhhyo--/sy: 
"  `oh+-.:syhhhhhhhhho  hhhddhhhyo-.:+yo  
"   .oho-.:+sshhhhhhhhsshhhhhhys+-.:+yo`  
"    `+hs:..:+syyhhhhhhhhhhyso/-..:oy/    
"      .+yo:..-:+oossyyssso/:..-:os+.     
"        `:os+:.....-:---...-:+oo:`       
"           `-/++//:::::://++/-`          
"                ``.......`     
"
" Author: Billy Whited 
" File:   Colorscheme
" Title:  Typograph
"
" ---------------------------------------- "

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name       ="typograph"

hi Normal               guifg=#222222 guibg=#EEEEEE gui=NONE
hi Cursor               guifg=#FFFFFF guibg=#FF0000 gui=NONE
hi LineNr               guifg=#BBBBBB guibg=#EEEEEE gui=NONE
hi StatusLine           guifg=#888888 guibg=#DDDDDD gui=NONE
hi StatusLineNC         guifg=#DDDDDD guibg=#DDDDDD gui=NONE
hi VertSplit            guifg=#DDDDDD guibg=#EEEEEE gui=NONE
hi NonText              guifg=#EEEEEE guibg=#EEEEEE gui=NONE

hi NERDTreeDir          guifg=#222222 guibg=#EEEEEE gui=BOLD
hi NERDTreeDirSlash     guifg=#EEEEEE guibg=#EEEEEE gui=NONE
hi NERDTreeCWD          guifg=#888888 guibg=#EEEEEE gui=NONE
hi link NERDTreeBookmarksHeader NERDTreeCWD
hi link NERDTreeBookmarkName NERDTreeDir
hi NERDTreeLink         guifg=#222222 guibg=#EEEEEE gui=ITALIC
hi NERDTreeUp           guifg=#0000EE guibg=#EEEEEE gui=NONE
hi NERDTreeHelp         guifg=#FF0000 guibg=#EEEEEE gui=NONE
hi NERDTreeRO           guifg=#888888 guibg=#EEEEEE gui=NONE  
hi NERDTreeStatusline   guifg=#EEEEEE guibg=#EEEEEE gui=NONE

hi htmlTag              guifg=#BB0000 guibg=#EEEEEE gui=NONE
hi htmlTagName          guifg=#BB0000 guibg=#EEEEEE gui=NONE
hi htmlArg              guifg=#880000 guibg=#EEEEEE gui=NONE 
hi htmlString           guifg=#FF0000 guibg=#EEEEEE gui=NONE 
hi htmlEndTag           guifg=#CC0000 guibg=#EEEEEE gui=NONE
hi htmlH2               guifg=#222222 guibg=#EEEEEE gui=BOLD
hi htmlLink             guifg=#0000EE guibg=#EEEEEE gui=UNDERLINE
hi htmlSpecialChar      guifg=#888888 guibg=#EEEEEE gui=NONE

hi link cssTagName      htmlTag     
hi link cssIdentifier   htmlArg   
hi link cssClassName    htmlArg
hi link cssSelectorOp   htmlString 
hi link cssMediaComma   htmlString
hi link cssPseudo       htmlString
hi link cssPseudoClass  htmlString
hi link cssPseudoClassId htmlString
hi link cssBraces       htmlString

hi cssProp              guifg=#222222 guibg=#EEEEEE gui=NONE 

hi link cssBoxProp      cssProp
hi link cssUIProp       cssProp
hi link cssColorProp    cssProp
hi link cssFontProp     cssProp
hi link cssRenderProp   cssProp
hi link cssTextProp     cssProp
hi link cssGeneratedContentProp   cssProp

hi cssValue             guifg=#0000EE guibg=#EEEEEE gui=NONE

hi link cssCommonAttr   cssValue
hi link cssTextAttr     cssValue
hi link cssRenderAttr   cssValue
hi link cssValueNumber  cssValue
hi link cssFunctionName cssValue
hi link cssUIAttr       cssValue
hi link cssFontAttr     cssValue
hi link cssColorAttr    cssValue

hi cssFunction          guifg=#0099FF guibg=#EEEEEE gui=NONE

hi link cssUrl          cssFunction
hi link cssStringQQ     cssFunction
hi link cssUnicodeEscape cssFunction
hi link cssValueLength  cssFunction

hi link vimLineComment  LineNr
hi link WindowDIM       LineNr
