#!/bin/bash

VIM_DIR=~/.vim
BUNDLE_DIR=$VIM_DIR/bundle
AUTOLOAD_DIR=$VIM_DIR/autoload

# Pathogen first
mkdir -p $AUTOLOAD_DIR $BUNDLE_DIR
curl -LSso $AUTOLOAD_DIR/pathogen.vim https://tpo.pe/pathogen.vim

# The plugins.
# Removing the powerline fonts, I will use the InputMono fonts from:
# http://input.fontbureau.com/
# "https://github.com/powerline/fonts"


# NOTE. Consider exploring the following plugins
# https://github.com/itchyny/calendar.vim

PLUGINS=(
    "https://github.com/bling/vim-airline"
    "https://github.com/easymotion/vim-easymotion"
    "https://github.com/junegunn/goyo.vim"
    "https://github.com/vim-scripts/scratch.vim"

    "https://github.com/airblade/vim-gitgutter"
    "https://github.com/tpope/vim-fugitive"

    "https://github.com/pangloss/vim-javascript"
    "https://github.com/elzr/vim-json"

    "https://github.com/kien/ctrlp.vim"
    "https://github.com/scrooloose/nerdtree"
    "https://github.com/mileszs/ack.vim"

    "https://github.com/scrooloose/syntastic"
    "https://github.com/scrooloose/nerdcommenter"
    "https://github.com/mattn/emmet-vim"
    "https://github.com/honza/vim-snippets"
    "https://github.com/SirVer/ultisnips"

    "https://github.com/nanotech/jellybeans.vim"
    "https://github.com/morhetz/gruvbox"
)

# Iterate over the list and clone
cd $BUNDLE_DIR
for pluginProject in "${PLUGINS[@]}"
do
    dirName=$(basename $pluginProject)
    if [ -d $dirName ]; then
        cd $dirName
        git pull
        cd $OLDPWD
    else
        echo "Cloning $dirName"
        git clone -q $pluginProject
    fi
done

echo "Copying .vimrc to ~/.vimrc"
cp ./.vimrc ~/.vimrc

# TODO try differentiate linux/mac in order to install the following programs
# if [ $(uname -s) = 'Darwin' ]; then

echo "Now is time to install AG and eslint"
echo "AG: https://github.com/ggreer/the_silver_searcher"
echo "ESLint: https://github.com/eslint/eslint"
