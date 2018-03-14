" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

echo ">^.^<"

filetype plugin indent on
syntax on

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set nu

" Autowrite that writes the content of the file automatically if you call :make
set autowrite

"For tab characters that appear 2-spaces-wide:
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

"For edit file forget with sudo

" tell vim to keep a backup file
set backup

" tell vim where to put its backpu file
set backupdir=/private/tmp

" tell vim where to put swap files
set dir=/private/tmp

" Save marks when exit
set viminfo='100,f1

" <### vim-plug plugins mananger ###> --- {{{
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Airline use :AirlineTheme <theme>
" To set in .vimrc, use let g:airline_theme='<theme>'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}

" Airline
let g:airline_theme='luna'

" <### Editor KeyMap Begin###> ----{{{
" Set mapleader, maplocalleader
let mapleader=","
let maplocalleader=","

" insert mode user jk to ESC
inoremap jk <esc>
inoremap <esc> <nop>

" save your file
nnoremap <leader>s :w<cr>
" close your file
nnoremap <leader>q :q<cr>

" edit your vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>

" source your vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" switch current line with next line
nnoremap - ddp

" switch current line with previous line
nnoremap _ ddkP

" Convert word to uppercase in Insert Mode	
inoremap <leader><c-u> <esc>gUiwea

" Convert word to uppercase in Normal Mode
nnoremap <leader><c-u> gUiw

" Wrap word with "
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel


" Wrap word with ' 
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Wrap word with () 
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel

" Open file with zfz
nnoremap <c-p> :Files<cr>
inoremap <c-p> :Files<cr>

" quickfix
noremap <c-n> :cnext<cr>
noremap <c-m> :cprevious<cr>
nnoremap <leader>a :cclose<cr>

" Go
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
	

" Habit breaking arrow keys and esc key ---- {{{
noremap <Up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

inoremap <Up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}

" <### Ediror KeyMap End ###>
" }}}

" Vimscript file setting --------{{{
augroup FileType_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" VimGO -zo----{{{
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['golint', 'errcheck']
let g:go_metalinter_autosave = 1

let g:go_auto_type_info = 1
set updatetime=100
" }}}

