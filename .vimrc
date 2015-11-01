"~/.vimrc"
"Test"

set nocompatible
source $VIMRUNTIME/vimrc_example.vim

"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
	if &sh =~ '\<cmd'
  	let cmd = '""' . $VIMRUNTIME . '\diff"'
  	let eq = '"'
	else
  	let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	endif
  else
	let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"SET
set nocompatible
set nowrap                                    	" Don't wrap long lines
set autoindent                                	" Do auto-indenting
set nocindent                                 	" But don't do wacky C style indenting
"set bs=4                                      	" allow backspacing over everything in insert mode
set showmatch                                 	" always set showmatch on
set expandtab                                 	" Use spaces instead of tabs
set softtabstop=4                             	" Use spaces instead of tabs
set tabstop=2                                 	" If you insist on using tabs, use the same tabstop
set viminfo='20,\"50                          	" read/write a .viminfo file, don't store more than 50 lines of registers
set history=50                                	" keep 50 lines of command line history
set ruler                                     	" show the cursor position all the time

"-------------------------------------------------------------------------------
"- Start: Add 04/26/2006
"-------------------------------------------------------------------------------
set comments=b://
set textwidth=256
set nobackup
set report=2
set smarttab
set shiftwidth=2
"set backupdir=/proj/bobcata_ver_user1/jdin/  	" keep a backup file (defaults to .filename~)
set mousehide                                 	" Hide the mouse pointer while typing

set visualbell                                	" Turn off sound


map <F3> :set invhlsearch                    	" <F3>	toggle highlight search
map <F4> :set invignorecase                  	" <F4>	toggle ignorecase
map <F2> :set invautoindent
map <F5> :set mouse=v
map <F6> :set mouse=a


" lhs comments -- select a range then hit ,# to insert hash comments
" or ,/ for // comments, or ,c to clear comments.
map ,# :s/^/#/<CR> <Esc>:nohlsearch <CR>
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR> <Esc>:nohlsearch<CR>

" wrapping comments -- select a range then hit ,* to put  /* */ around
" selection, or ,d to clear them
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR> <Esc>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> <Esc>:nohlsearch<CR>

" to clear hlsearch -- hit ,h to clear highlighting from last search
map ,h :nohlsearch <CR>

"-------------------------------------------------------------------------------
"- Start: Add 04/26/2006
"-------------------------------------------------------------------------------

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
	autocmd BufNewFile,BufRead Makefile set noexpandtab " Makefiles ensure that we don't expand tabs since tabs are special
endif


syntax off
"" set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*

"-------------------------------------------------------------------------------
"- Start: Add 10/20/2010
"-------------------------------------------------------------------------------
"map <F7> : source /tool/pandora64/.package/vim-7.2/share/vim/vim72/macros/matchit.vim
map <F7> : let b:match_words = 'begin:end'
map <F8> : resize
map <F9> : vertical resize
set winheight=20
set winminheight=1
set winwidth=20
set winminwidth=5
syntax off
syntax on  "before any local syntax file

"map <S-F1> : source ~/.vim/vimfiles/syntax/verilog_systemverilog.vim
"source /tool/pandora64/.package/vim-7.2/share/vim/vim72/macros/matchit.vim
"source /usr/share/vim/vim72/macros/matchit.vim
"source ~/.vim/vimfiles/syntax/verilog_systemverilog.vim
"
source $VIMRUNTIME/macros/matchit.vim
let b:match_words = '\<begin\>:\<end\>'

