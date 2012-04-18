" Vim color scheme
"
" Name:        railscast.vim
" Maintainer:  Josh O'Rourke <jorourke23@gmail.com>
" License:     public domain
"
" A GUI Only port of the RailsCasts TextMate theme [1] to Vim.
" Some parts of this theme were borrowed from the well-documented Lucius theme [2].
"
" [1] http://railscasts.com/about
" [2] http://www.vim.org/scripts/script.php?script_id=2536

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "railscasts"

" Colors
" Brown        #BC9458
" Dark Blue    #6D9CBE
" Dark Green   #519F50
" Dark Orange  #CC7833
" Light Blue   #D0D0FF
" Light Green  #A5C261
" Tan          #FFC66D

hi Normal                    guifg=#E6E1DC guibg=#2B2B2B
hi Cursor                    guibg=#FFFFFF
hi CursorLine                guibg=#333435
hi Search                    guibg=#5A647E
hi Visual                    guibg=#5A647E
hi LineNr                    guibg=#2B2B2B guifg=#777777 gui=NONE
hi StatusLine                guibg=#414243 gui=NONE
hi StatusLineNC              guibg=#262626 guifg=#1F1F1F gui=NONE
hi VertSplit                 guibg=#2B2B2B guifg=#777777 gui=NONE 
hi NonText                   guifg=#2B2B2B guibg=#2B2B2B
hi IndentGuidesOdd           guibg=#303030  
hi IndentGuidesEven          guibg=#303030 

" Folds
" -----
" line used for closed folds
hi Folded                    guifg=#F6F3E8 guibg=#444444 gui=NONE

" Misc
" ----
" directory names and other special names in listings
hi Directory                 guifg=#A5C261 gui=NONE

" Popup Menu
" ----------
" normal item in popup
hi Pmenu                     guifg=#F6F3E8 guibg=#444444 gui=NONE
" selected item in popup
hi PmenuSel                  guifg=#000000 guibg=#A5C261 gui=NONE
" scrollbar in popup
hi PMenuSbar                 guibg=#5A647E gui=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb                guibg=#AAAAAA gui=NONE


hi Comment                   guifg=#BC9458 gui=italic
hi Todo                      guifg=#BC9458 guibg=NONE gui=italic
hi Constant                  guifg=#6D9CBE
hi Define                    guifg=#CC7833
hi Delimiter                 guifg=#519F50
hi Error                     guifg=#FFFFFF guibg=#990000
hi Function                  guifg=#FFC66D gui=NONE
hi Identifier                guifg=#D0D0FF gui=NONE
hi Include                   guifg=#CC7833 gui=NONE
hi Keyword                   guifg=#CC7833
hi Macro                     guifg=#CC7833 gui=NONE
hi Number                    guifg=#A5C261
hi PreCondit                 guifg=#CC7833 gui=NONE
hi PreProc                   guifg=#CC7833 gui=NONE
hi Statement                 guifg=#CC7833 gui=NONE
hi String                    guifg=#A5C261
hi Title                     guifg=#FFFFFF
hi Type                      guifg=#DA4939 gui=NONE

hi DiffAdd                   guifg=#E6E1DC guibg=#144212
hi DiffDelete                guifg=#E6E1DC guibg=#660000

hi link htmlTag              xmlTag
hi link htmlTagName          xmlTagName
hi link htmlEndTag           xmlEndTag

hi xmlTag                    guifg=#E8BF6A
hi xmlTagName                guifg=#E8BF6A
hi xmlEndTag                 guifg=#E8BF6A

