## ALE

Asynchronous Linter Engine.

Use ALE to lint code is a life-saver.

### Linter

Once this plugin is installed, while editing your files in supported languages and tools which have been correctly installed, this plugin will sedn the contents of your text buffers to a variety of programs for checking the syntax and semantics of your code.


### Fixing

You can even to config lint-fixer to fix your code when saving your code or executing command `:ALEFix`. These need you to configure some functions in each buffer with a `b:ale_fixers` or globally with `g:ale_fixers`

Fox example, I config the function globally and set auto-fixing on file save.

```vim
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
```
