#!/bin/bash

VIM_DIR=~/.vim
BUNDLE_DIR=$VIM_DIR/bundle
AUTOLOAD_DIR=$VIM_DIR/autoload

# Pathogen first
mkdir -p $AUTOLOAD_DIR $BUNDLE_DIR
curl -LSso $AUTOLOAD_DIR/pathogen.vim https://tpo.pe/pathogen.vim

# The plugins.
PLUGINS=(
    "https://github.com/bling/vim-airline"
    "https://github.com/tpope/vim-fugitive"
    "https://github.com/scrooloose/nerdtree"
    "https://github.com/scrooloose/syntastic"
    "https://github.com/kien/ctrlp.vim"
    "https://github.com/scrooloose/nerdcommenter"
    "https://github.com/pangloss/vim-javascript"
    "https://github.com/mileszs/ack.vim"
    "https://github.com/airblade/vim-gitgutter"
    "https://github.com/powerline/fonts"
)

# Iterate over the list and clone
for pluginProject in "${PLUGINS[@]}"
do
    git clone $pluginProject
done
