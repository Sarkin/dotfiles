Prerequisites:
tmux, git, curl, wget, zsh, oh-my-zsh, pip3
Don't forget neovim

sudo apt-get update
sudo apt-get install tmux curl git wget zsh python3-pip
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Install vim-plug:
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Python support for neovim:
pip3 install neovim
