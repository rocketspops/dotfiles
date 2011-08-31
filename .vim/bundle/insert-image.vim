call NERDTreeAddKeyMap({
    \ 'key': 'b',
    \ 'callback': 'NERDTreeInsertImage',
    \ 'quickhelpText': 'Insert XHTML tag of image' })

function! NERDTreeInsertImage()
    let n=g:NERDTreeFileNode.GetSelected()
    if n!={}
      let path=escape(n.path.str(),' ')
      let theWH=substitute(system('identify -format %wx%h "'.path.'"'),'\n','','')
      if(path[0]=='/')
        let path=Absolute2Relative(path)
      endif  
      let theWH=substitute(theWH,'\([0-9]*\)x\([0-9]*\)','<img src="'.path.'" width="\1" height="\2" alt="" />','')
      let @i = theWH
      normal p"ip==
    endif
endfunction


