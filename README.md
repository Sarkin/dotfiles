# Prerequisites:
tmux, git, curl, wget, zsh, oh-my-zsh, pip3

```
sudo apt-get update
sudo apt-get install tmux curl git wget zsh python3-pip

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## neovim 
Build neovim from sources for coc.nvim floating window integration:
<https://github.com/neovim/neovim/releases/tag/nightly>

Install vim-plug:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### C++ LSP
<https://github.com/MaskRay/ccls>

### coc.nvim
Extensions: coc-json, coc-python, coc-snippets, coc-lists
