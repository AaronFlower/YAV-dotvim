" A vimrc file maintained by AaronFlower

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


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Editor settings
set number

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
set backupdir=/tmp

" tell vim where to put swap files
set dir=/tmp

" Save marks when exit
set viminfo='100,f1

" <### vim-plug plugins mananger ###> --- {{{
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Airline use :AirlineTheme <theme>
" To set in .vimrc, use let g:airline_theme='<theme>'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" molokai theme
Plug 'fatih/molokai'

" git fugitive
Plug 'tpope/vim-fugitive'
call plug#end()
" }}}

" Airline
let g:airline_theme='luna'

" molokai color scheme
let g:rehash256=1
let g:molokai_original=1
color molokai

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

" Toggle paste mode
nnoremap <leader>p :set paste!<cr>

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

