##  YouCompleteMe

```
Plug "Valloric/YouCompleteMe"
```

在 Vim-Plug 所 YouCompleteMe 下载之后，会把执行相应的 hook `git submodule update --init —recursive`. 把依赖的 submodules 给下载过来。

### **注意**

在使用 `:PlugUpdate` 更新后，需要到 `~/.vim/plugged/YouCompleteMe`重新安装下。

```
py install.py --clang-completer --go-completer --ts-completer --rust-completer --java-completer
```
