" https://realpython.com/vim-and-python-a-match-made-in-heaven/ 
" To add proper PEP8 indention
autocmd BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

