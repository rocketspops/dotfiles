set nocompatible

filetype off
call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()
syntax on
filetype plugin indent on

runtime macros/matchit.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

set title titlestring=%<%F%=%l/%L-%P titlelen=70

" MAKE IT EASY TO UPDATE/RELOAD _vimrc

:nmap ,s :source ~/.vimrc
:nmap ,v :e ~/.vimrc

syntax enable
set background=dark
colorscheme solarized
set guifont=Source\ Code\ Pro:h11

set ofu=syntaxcomplete#Complete
set bs=indent,eol,start  "Allow backspacing over everything in insert mode

set noeb vb t_vb= "Disable Visual bell and error bell

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set spell   "Enable spell checking
set foldenable  "Enable code folding
set foldmethod=syntax
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
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
set encoding=utf-8 " Necessary to show unicode glyphs
set nuw=5
set laststatus=2

set wildmenu
set wildignore=.hg/,.git/,.svn/
set wildignore+=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc
set wildignore+=*.*.sw*,*.*.sw*.*
set wildignore+=*.DS_Store
set wildmode=list:longest

set go-=T   "Hide toolbar
set ruler
set number
set wrap
set textwidth=0
set mousehide "Hide the mouse cursor when typing

set showmatch   "Show matching brackets

set lines=50
set linespace=0

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"NERDTree Configuration

map <Leader>nt :NERDTreeToggle<CR>
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

let NERDTreeIgnore = ['\.sw*', '\.DS_\a*']

"Emmet Configuration
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_install_global = 0
let g:user_emmet_mode='a' "enables all functions in all modes.
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/git/dotfiles/.snippets_custom.json')), "\n"))
autocmd FileType html,css EmmetInstall

"Indent Guides Configuration
let g:indent_guides_enable_on_vim_startup = 0
:nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

"Custom Mappings
nmap <Leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

"Airline configuration

let g:airline_left_sep=''
let g:airline_right_sep=''

"Toggle relative line numbers
function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc

nnoremap <C-L> :call g:ToggleNuMode()<cr>

" Highlight and remove trailing white spaces
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>


