# Yet Another Vimrc configuration file.

## How to use?

```
git clone https://github.com/AaronFlower/YAV-dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall +qall
vim +GoInstallBinaries +qall
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

