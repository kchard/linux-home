#!/bin/bash
set -o errexit
set -o nounset

install_tools() {
    sudo apt-get update && sudo apt-get install -y git tmux vim

}

setup_git() {
    git config --global user.email "krchard@gmail.com"
    git config --global user.name "Kevin Chard"
}

setup_vim() {
    mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    pushd $HOME/.vim/bundle
    if [ ! -d nerdtree ]; then
        git clone git@github.com:scrooloose/nerdtree.git
    fi
    if [ ! -d ctrlp.vim ]; then
        git clone git@github.com:kien/ctrlp.vim.git
    fi
    popd
}

link_dot_files() {
    ln -sf $REPOS/linux-home/.bash_aliases $HOME/.bash_aliases
    ln -sf $REPOS/linux-home/.vimrc $HOME/.vimrc
    ln -sf $REPOS/linux-home/.tmux.conf $HOME/.tmux.conf
}

link_dot_bin() {
    ln -sf $REPOS/.bin $HOME/.bin
}

install_tools
setup_vim
link_dot_files
link_dot_bin
