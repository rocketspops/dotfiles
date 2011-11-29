set nocompatible

filetype off
call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()
syntax on
filetype plugin indent on

runtime macros/matchit.vim

set title titlestring=%<%F%=%l/%L-%P titlelen=70

" MAKE IT EASY TO UPDATE/RELOAD _vimrc
:nmap ,s :source ~/.vimrc
:nmap ,v :e ~/.vimrc

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

set showcmd 
set showmode
set shortmess=AaOoT
set history=1000

set timeout
set timeoutlen=500

set ttyfast

set laststatus=2

set wildmenu 
set wildignore+=.hg/,.git/,.svn/                    " Version control
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildmode=list:longest  

set formatprg=par "Use Par engine for text formatting.

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"NERDTree Configuration

map <Leader>n :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

let NERDTreeMinimalUI           = 1
let NERDTreeQuitOnOpen          = 0
let NERDChristmasTree           = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeWinSize             = 35
let NERDTreeDirArrows           = 1
let NERDTreeStatusline          = ' '
let NERDTreeShowHidden          = 1
let NERDTreeChDirMode           = 1
let NERDTreeShowLineNumbers     = 0
let NERDTreeMouseMode           = 2
let NERDTreeAutoCenter          = 1
let NERDTreeAutoCenterThreshold = 10
let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1

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

"Powerline configuration

let g:Powerline_symbols = 'fancy' 
let g:Powerline_theme = 'local' 

"Syntastic Configuration

let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_auto_loc_list=1

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


