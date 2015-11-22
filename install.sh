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

PLUGINS=(
    "https://github.com/bling/vim-airline"
    "https://github.com/easymotion/vim-easymotion"
    "https://github.com/junegunn/goyo.vim"
    "https://github.com/vim-scripts/scratch.vim"
    "https://github.com/mattn/calendar-vim"

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
        echo "Updating $dirName"
        git pull
        cd $OLDPWD
    else
        echo "Cloning $dirName"
        git clone -q $pluginProject
    fi
done

echo "Linking ~/.vimrc to .vimrc"
if [ -z $HOME/.vimrc ]; then
    currentDir=$(pwd)
    ln -s $currentDir/.vimrc $HOME/.vimrc
else
    echo "~/.vimrc already exist, link manually"
fi

if [ $(uname -s) = 'Darwin' ]; then
    if [ -z $(which brew) ]; then
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    if [ -z $(which ag) ]; then
        echo "Installing ag"
        brew install the_silver_searcher
    fi
fi

echo "Now is time to install eslint"
echo "ESLint: https://github.com/eslint/eslint"
