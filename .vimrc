set nocompatible

filetype off
call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()
syntax on
filetype plugin indent on

runtime macros/matchit.vim

:auto BufEnter * let &titlestring = hostname() . "/" . expand("%:p")
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
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%P                        " percentage of file

set wildmenu 
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc
set wildmode=list:longest  

set formatprg=par "Use Par engine for text formatting.

"NERDTree Configuration

map <Leader>n :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

:let NERDTreeQuitOnOpen   = 0
:let NERDChristmasTree    = 1
:let NERDTreeHighlightCursorline = 0
:let NERDTreeWinSize      = 35
:let NERDTreeDirArrows    = 1
:let NERDTreeStatusline   = ' '
:let NERDTreeShowHidden   = 1
:let NERDTreeChDirMode    = 1
:let NERDTreeShowLineNumbers = 0
:let NERDTreeMouseMode       = 2
:let NERDTreeAutoCenter = 1
:let NERDTreeAutoCenterThreshold = 10
:let g:loaded_netrw       = 1
:let g:loaded_netrwPlugin = 1

"Indent Guides Configuration

let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 0
let g:indent_guides_enable_on_vim_startup = 1

"Command T Configuration

let g:CommandTMaxHeight = 10
let g:CommandTMaxFiles = 100

nmap <silent> <Leader>o :CommandT<CR>
nmap <silent> <Leader>O :CommandTBuffer<CR>

"Zen Coding Bindings

let g:user_zen_expandabbr_key = '<c-e>'

"Alphabetically sort CSS properties in file with :SortCSS 
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort   

"Custom Mappings

nmap <Leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

"Insert a closing brace on the same line
inoremap {      {}<Left> 

"Insert closing brace on the line below the cursor
inoremap {<CR>  {<CR>}<Esc>O

"Insert a single brace
inoremap {{     {

"Insert open/closing brace as normal
inoremap {}     {}

"Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! g:ToggleNuMode() 
  if(&rnu == 1) 
    set nu 
  else 
    set rnu 
  endif 
endfunc 

nnoremap <C-L> :call g:ToggleNuMode()<cr> 

augroup BgHighlight
  autocmd!
  autocmd BufEnter * filetype detect 
  autocmd BufLeave * if &ft != 'nerdtree' | set ft=dim | endif
augroup END


