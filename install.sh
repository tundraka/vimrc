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
    "https://github.com/easymotion/vim-easymotion"
    "https://github.com/mattn/emmet-vim"
)

# Iterate over the list and clone
cd $BUNDLE_DIR
for pluginProject in "${PLUGINS[@]}"
do
    dirName=`basename $pluginProject`
    if [-d $dirName]; then
        cd $dirName
        git pull
        cd $OLDPWD
    else
        git clone $pluginProject
    fi
done

echo "Now is time to install AG and eslint"
