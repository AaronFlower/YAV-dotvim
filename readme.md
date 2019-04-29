j Yet Another Vimrc configuration file.

## How to use?

```
git clone https://github.com/AaronFlower/YAV-dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall +qall
vim +GoInstallBinaries +qall
# Because YouCompleteMe needs installed.
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer --go-completer --ts-completer --rust-completer
```

**Note**: If you don't clone this repository into `~/.vim`, you should link the `repository` to `~/.vim`.

### fzf
Because, we depends fzf plugin, we should install fzf to complete the vim plugin config.

Please refers to [fzf](https://github.com/junegunn/fzf)

### ag
Because of following config:

```bash
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
```

we should install `ag`.

### Denite

Because Denite, we should install pynvim
```
pip3 install --user pynvim
```

## How update

** Note: YouCompleteMe  **

In vim to run `:PlugInstall` to complete install. In this process, YouCompleteMe may take some minutes.
After installed your should to run the commands to complete install.

Remember: YCM is a plugin with a compiled component. If you update YCM using Vundle and the ycm_core library APIs have changed (happens rarely), YCM will notify you to recompile it. You should then rerun the install process.

```
~/.vim/plugged/
cd ~/.vim/plugged/YouCompleteMe/
./install.py --clang-completer
```
`./install.py ` supports tags. Please note that different option tags need different egine.

`--cs-completer` 	C# support: install Mono
`--go-completer` 	Go support: install Go
`--ts-completer` 	JavaScript and TypeScript
`--rust-completer`	Rust support: install Rust
`--java-completer`	Java support: install JDK8 (version 8 required)

### YCM for C/C++

在 C/C++ 的项目中使用 YCM, 我们需要使用 `ycm_extra_conf.py` 文件来配置下环境信息。最简单的是返回基本的 flags.

```python
def Settings( **kwargs ):
  return {
    'flags': [ '-x', 'c++', '-Wall', '-Wextra', '-Werror' ],
  }
```

另外可以使用： `:YcmDebugInfo` 来调试信息, 查看当前加载的配置文件以及相应的 flags 信息是否正确。


### 2. Ale-lint


Asynchronous Linter Engine.

Use ALE to lint code is a life-saver.

#### 2.1 Linter

Once this plugin is installed, while editing your files in supported languages and tools which have been correctly installed, this plugin will sedn the contents of your text buffers to a variety of programs for checking the syntax and semantics of your code.


#### 2.2 Fixing

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

## Vim Directories Explained

### ~/.vim/colors/

Vim colors and themes

### ~/.vim/plugin/
Shells to execute when vim start!

### ~/.vim/ftdetect/

Any files in ~/.vim/ftdetect/ will also be run every time you start Vim.

ftdetect stands for "filetype detection".

### ~/.vim/ftplugin/


### ~/.vim/indent/

### ~/.vim/autoload
The ~/.vim/autoload/ directory is an incredibly important hack. It sounds
a lot more complicated than it actually is.

In a nutshell: autoload is a way to delay the loading of your plugin's code
until it's actually needed. We'll cover this in more detail later when we
refactor our plugin's code to take advantage of it.

### ~/.vim/doc/
