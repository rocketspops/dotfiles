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
let g:colors_name = "typograph"

hi Normal guifg=#111111 guibg=#EEEEEE gui=NONE
hi LineNr guifg=#CCCCCC guibg=NONE gui=NONE
hi StatusLine guifg=#EEEEEE guibg=#999999 gui=NONE
hi StatusLineNC guifg=#EEEEEE guibg=#DDDDDD gui=NONE
hi VertSplit guifg=#DDDDDD guibg=#DDDDDD gui=NONE

hi link vimLineComment LineNr
hi link WindowDIM LineNr
