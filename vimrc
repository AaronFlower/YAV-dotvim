" A vimrc file maintained by AaronFlower

echom ">^.^<"

if has('python3')
	" echom 'python3'
endif

filetype plugin indent on
set encoding=utf-8

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has('vms')
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" set for bracketed paste mode
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Editor settings
set number

" Autowrite that writes the content of the file automatically if you call :make
set autowrite

"For tab characters that appear 2-spaces-wide:
"set tabstop=4
"set softtabstop=0 noexpandtab
"set shiftwidth=4

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

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

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" git fugitive
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" php
Plug 'StanAngeloff/php.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/indentpython.vim'

" python
" Also add PEP8 checking with this nifty little plugin
Plug 'python-mode/python-mode'
" Plug 'nvie/vim-flake8'

" multiple-line-editor
Plug 'terryma/vim-multiple-cursors'

" YCM
Plug 'Valloric/YouCompleteMe'

" Generic programming
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'

" Vue
Plug 'posva/vim-vue'

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

" reload your vimrc
nnoremap <leader>cv :source $MYVIMRC<cr>

" switch current line with next line
nnoremap - ddp

" switch current line with previous line
nnoremap _ ddkP

" Convert word to uppercase in Insert Mode	
inoremap <leader><c-u> <esc>gUiwea

" Convert word to uppercase in Normal Mode
nnoremap <leader><c-u> gUiw

" Toggle tAgbar
nnoremap <leader>a :TagbarToggle<cr>

" Toggle paste mode
" nnoremap <leader>p :set paste!<cr>

" Wrap word with "
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel


" Wrap word with ' 
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Wrap word with () 
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel

" Open file with fzf
function! FzfOpenFiles()
	let is_git = system('git status')
	if v:shell_error
		:Files
	else
		" :GitFiles
		" if you want to use preview for gitfiles
		call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))
	endif
endfunction

nnoremap <leader>p :Files<cr>
nnoremap <c-p> :call FzfOpenFiles()<cr>
inoremap <c-p> :call FzfOpenFiles()<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <leader>, :Commands<cr>
nnoremap <c-g>h :Ag<cr>

" custom fzf commands
function! s:change_branch(e)
	let res = system("git checkout" . a:e)
	:e!
	:AirlineRefresh
	echom "Changed branch to " . a:e
endfunction

command! Gbranch call fzf#run(
	\{
	\ 'source': 'git branch',
	\ 'sink': function('<sid>change_branch'),
	\ 'options': '-m',
	\ 'down': '20%'
	\})

" use coderay/rougify to preview file
" need coderay/rougify installed
" only for Files
let g:fzf_files_options = '--preview "rougify {} | head -'.&lines.'"'
" fzf insert mode
"inoremap <c-x><c-f> <plug>(fzf-complete-path)
"inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
"inoremap <c-x><c-l> <plug>(fzf-complete-line)

" quickfix
" noremap <c-n> :cnext<cr>
" noremap <c-m> :cprevious<cr>
" nnoremap <leader>a :cclose<cr>
function! ToggleQuickFix()
  if exists("g:qwindow")
    lclose
    unlet g:qwindow
  else
    try
      lopen 10
      let g:qwindow = 1
    catch 
      echo "No Errors found!"
    endtry
  endif
endfunction

nmap <script> <silent> <leader>cc :call ToggleQuickFix()<CR>


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
"split navigations
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h	

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

" vim-python ---{{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" for python
let python_highlight_all=1

let g:pymode_python = 'python3'
let g:pymode_rope_complete_on_dot = 0

" }}}

" YCM config {{{
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}

" Nerdtree config {{{

nnoremap <leader>t :NERDTreeToggle<cr>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"}}}

" emmet-vim ---- {{{
"}}}

" source python config
" source ~/.vim/custom/py.vimrc

syntax on

