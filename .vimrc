set nocompatible

filetype off
call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()
syntax on
filetype plugin indent on

runtime macros/matchit.vim

:set title titlestring=%<%F%=%l/%L-%P titlelen=70
:set showcmd

set ofu=syntaxcomplete#Complete

set bs=indent,eol,start  "Allow backspacing over everything in insert mode

set noeb vb t_vb= "Disable Visual bell and error bell

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set spell   "Enable spell checking		 	        	
set foldenable  "Enable code folding
set autoindent
set smartindent

set expandtab
set shiftwidth=2
set softtabstop=2
set formatoptions=tcqw "Default (tcq) + (w) to end para with non-white space

set showmode
set history=100	

set laststatus=1
"set statusline+=%<\                       " cut at start
"set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
"set statusline+=%-40f\                    " relative path
"set statusline+=%=                        " seperate between right- and left-aligned
"set statusline+=%1*%y%*%*\                " file type
"set statusline+=%10(L(%l/%L)%)\           " line
"set statusline+=%P                        " percentage of file

set wildmenu 
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc
set wildmode=list:longest  

set formatprg=par "Use Par engine for text formatting.

"NERDTree Configuration

map <Leader>n :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

:let NERDTreeQuitOnOpen          = 0
:let NERDChristmasTree           = 1
:let NERDTreeHighlightCursorline = 0
:let NERDTreeWinSize             = 35
:let NERDTreeDirArrows           = 1
:let NERDTreeStatusline          = ' '
:let NERDTreeShowHidden          = 1
:let NERDTreeChDirMode           = 1
:let NERDTreeShowLineNumbers     = 0
:let NERDTreeMouseMode           = 2
:let NERDTreeAutoCenter          = 1
:let NERDTreeAutoCenterThreshold = 10
:let g:loaded_netrw              = 1
:let g:loaded_netrwPlugin        = 1

"Zen-Coding Configuration
let g:user_zen_leader_key = '<C-E>'

"Alphabetically sort CSS properties in file with :SortCSS 
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort   

"Custom Mappings
nmap <Leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>
inoremap {      {}<Left> 
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

"Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"Toggle relative line numbers
function! g:ToggleNuMode() 
  if(&rnu == 1) 
    set nu 
  else 
    set rnu 
  endif 
endfunc 

nnoremap <C-L> :call g:ToggleNuMode()<cr> 

"Implement buffer dimming
augroup BgHighlight
  autocmd!
  autocmd BufEnter * filetype detect 
  autocmd BufLeave * if &ft != 'nerdtree' | set ft=dim | endif
augroup END


