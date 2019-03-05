# Yet Another Vimrc configuration file.

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
