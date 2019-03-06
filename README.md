Prerequisites:
tmux, git, curl, wget, zsh, oh-my-zsh, nvim

sudo apt-get update
sudo apt-get install tmux curl git wget zsh neovim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Install vim-plug:
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
