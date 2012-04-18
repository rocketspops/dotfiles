let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
argglobal
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=wcroql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=syntaxcomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal smartindent
setlocal softtabstop=2
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!Pl#Statusline(0,0)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=8
setlocal tags=~/Git/css.vim/.git/vim.tags,~/Git/css.vim/.git/tags,./tags,tags
setlocal textwidth=72
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
25,92fold
98,108fold
109,119fold
120,124fold
125,197fold
198,208fold
209,218fold
219,339fold
340,350fold
93,351fold
357,380fold
381,428fold
429,440fold
441,477fold
478,501fold
352,502fold
503,633fold
634,765fold
766,883fold
884,907fold
908,1126fold
1127,1177fold
1178,1390fold
1391,1464fold
1465,1578fold
1579,1696fold
1697,1766fold
1767,1857fold
1858,2110fold
2111,2152fold
2153,2355fold
2356,2500fold
2501,2524fold
2525,2730fold
2731,2797fold
2798,2835fold
2836,2926fold
2927,3093fold
3094,3156fold
3157,3218fold
3222,3235fold
3236,3240fold
3241,3248fold
3249,3298fold
3299,3305fold
3306,3326fold
3327,3338fold
3339,3347fold
3348,3358fold
3359,3363fold
3364,3379fold
3380,3390fold
3391,3395fold
3396,3424fold
3219,3425fold
25
normal zc
93
normal zo
98
normal zc
109
normal zc
120
normal zc
125
normal zc
198
normal zc
209
normal zc
219
normal zc
340
normal zc
93
normal zc
352
normal zo
357
normal zc
381
normal zc
429
normal zc
441
normal zc
478
normal zc
352
normal zc
503
normal zc
634
normal zc
766
normal zc
884
normal zc
908
normal zc
1127
normal zc
1178
normal zc
1391
normal zc
1465
normal zc
1579
normal zc
1697
normal zc
1767
normal zc
1858
normal zc
2111
normal zc
2153
normal zc
2356
normal zc
2501
normal zc
2525
normal zc
2731
normal zc
2798
normal zc
2836
normal zc
2927
normal zc
3094
normal zc
3157
normal zc
3219
normal zo
3222
normal zc
3236
normal zc
3241
normal zc
3249
normal zc
3299
normal zc
3306
normal zc
3327
normal zc
3339
normal zc
3348
normal zc
3359
normal zc
3364
normal zc
3380
normal zc
3391
normal zc
3396
normal zc
3219
normal zc
let s:l = 2836 - ((2835 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2836
normal! 0
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
" vim: set ft=vim :
