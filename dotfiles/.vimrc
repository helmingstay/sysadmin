set history=500
" increment (don't collide with tmux control seq
:nnoremap <C-p> <C-a>
" save file from insert
inoremap <C-y> <C-\><C-o>:w<cr>
noremap <C-y> :w<cr>


if has("gui_running")
  if has("gui_gtk2")
    "set guifont=Consolas\ 20
    set guifont=Nimbus\ Mono\ L\ Bold\ 32
    set guicursor+=i-n-v-c:blinkon0
  endif
endif

execute pathogen#infect()

" 2023-10: airline
" See https://github.com/vim-airline/vim-airline/wiki/Screenshots
"let g:airline_theme='luna'
let g:airline_theme='minimalist'
" https://github.com/vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" https://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildmenu

au BufWinLeave * mkview
" see https://stackoverflow.com/questions/67419516/vim-how-to-detect-stdin-input-in-vimrc
au BufWinEnter * if get(v:argv, 1, '') != '' | silent loadview | endif 

:filetype on
:filetype plugin on
set viewoptions=folds,cursor

"set tags=.git/tags


"Make viminfo work well! save a lot of stuff in viminfo
set viminfo='1000,f1,:1000,/1000
"Don't want tabs replaced with spaces
set softtabstop=4 shiftwidth=4 tabstop=4 expandtab
"Tim Whitehead Sept 3, 2003
"Pulled from various people's on www.dotfiles.com and Vim help

" xian - Taglist
" https://wiki.archlinux.org/index.php/vim#Configuration
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
"nnoremap <C-l> :TlistToggle<CR>
"nnoremap <C-p> :!cscope -b -k <ENTER> :cs reset<ENTER><ENTER>
" remove extra space at bottom?
set guiheadroom=0

"save
nnoremap @W :w<ENTER>
nnoremap <C-n> <C-w><C-w>
"latex build
nnoremap @L :!pdflatex % <ENTER>

iab #b  /********* edit by xian,  ******
iab <expr> #t strftime("%c")

" Arduino
" c++ highlighting
autocmd BufNewFile,BufReadPost *.ino set filetype=cpp
" build and upload file
nnoremap @I :!ino build && ino upload<ENTER>
nnoremap @S :!ino clean && ino build -m pro328 && ino upload -m pro328 <ENTER>

" R - write yank buffer to temp file
nnoremap @R :redir! > ~/.rbuff.R<ENTER>:echo @0<ENTER>:redir END<ENTER><ENTER>

"Pascal Baranton
"...others
"sven ?
"like it already

"set wildmenu " turn on wild menu
set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets

"We want to use vim not vi
set nocp
"
"set selectmode=mouse
"use mouse for stuff
"set mouse=a
"Ignore case in searches
set ignorecase

syntax enable
set background=dark
"use w/tmux
let g:solarized_termcolors=256
colorscheme solarized

"syntax on
"colorscheme slate2 

:hi StatusLineNC ctermfg=cyan
"Incremental search (whatever that means)
set incsearch
"Disable splash screen
"set shortmess=0 "Doesn't seem to work w/ my system 
"Indent C code
"set cin
"No need to save on a :next :previous, etc
"Backspace permissions: [0-2] forget which does which
set backspace=2
"Title the term window
set title
"Smoother changes
set ttyfast
"Show uncompleted command
set showcmd
"Show matching parenthesis
set showmatch
"Show current mode
set showmode
"Keep cursor on same column when doing page movement
set nostartofline
"expansion key (I think it's like the bash command completion)
"set wildchar=<TAB>
"show current position
set ruler
"show report on changes to file, 0 means all changes
set report=0
"don't beep at me!!
set noerrorbells
"absolute quiet?
"set t_vb=
" Hide the mouse pointer while typing, from Alan De Smet
set mousehide
"always show the status line
set laststatus=2
"custom line: look at vim help
"set statusline=%4*%m%3*%<%F%3*%=\ %5*\ Lines\ %3l\ Columns\ %c\ %p%%\ %4*%m
set statusline=%<%f\ %y\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"move cursor anywhere (options!), from http://jmcpherson.org/vimrc.html
"look at help!
set virtualedit=block

"default file types configurations
"au BufNewFile *.tex  :r ~/headers/tex
"au FileType tex		set tw=80
"au FileType txt		set tw=80
au FileType rtf		set tw=80

"key word substitutions
"want to keep things somewhat readable on smaller screens...
"some nifty LaTeX partial macros/substitutions
imap =enm \begin{enumerate}<CR>\item<CR>\end{enumerate}<Esc>$ka<Space>
imap =inm \begin{itemize}<CR>\item<CR>\end{itemize}<Esc>$ka<Space>
imap =eqa \begin{equation}<CR>\begin{aligned}<CR><CR>\end{aligned}<CR>\end{equation}<Esc>$kka
imap =eqa* \begin{equation*}<CR>\begin{aligned}<CR><CR>\end{aligned}<CR>\end{equation*}<Esc>$kka
imap =equ* \begin{equation*}<CR><CR>\end{equation*}<Esc>$ka
imap =equ \begin{equation}<CR><CR>\end{equation}<Esc>$ka

"disable mouse scroll
"set mouse=i
" completely disable mouse
set mouse=
