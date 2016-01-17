#!/bin/bash

VIM_DIR=$HOME/.vim
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
    # Utils
    "https://github.com/kien/ctrlp.vim"
    "https://github.com/scrooloose/nerdtree"
    "https://github.com/mileszs/ack.vim"
    "https://github.com/bling/vim-airline"
    "https://github.com/easymotion/vim-easymotion"

    # Dev utils
    "https://github.com/scrooloose/syntastic"
    "https://github.com/scrooloose/nerdcommenter"
    "https://github.com/mattn/emmet-vim"

    # Utils random
    "https://github.com/junegunn/goyo.vim"
    "https://github.com/vim-scripts/scratch.vim"
    "https://github.com/mattn/calendar-vim"

    # git
    "https://github.com/airblade/vim-gitgutter"
    "https://github.com/tpope/vim-fugitive"

    # Javascript
    "https://github.com/pangloss/vim-javascript"
    "https://github.com/elzr/vim-json"
    "https://github.com/mxw/vim-jsx"
    "https://github.com/mustache/vim-mustache-handlebars.git"
    "https://github.com/isRuslan/vim-es6.git"

    # Snippets
    "https://github.com/tomtom/tlib_vim.git"
    "https://github.com/MarcWeber/vim-addon-mw-utils.git"
    "https://github.com/honza/vim-snippets"
    "https://github.com/SirVer/ultisnips"

    # Themes
    "https://github.com/nanotech/jellybeans.vim"
    "https://github.com/morhetz/gruvbox"

    # Other
    "https://github.com/tfnico/vim-gradle"
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
        hb="https://raw.githubusercontent.com/Homebrew/install/master/install"
        ruby -e "$(curl -fsSL $hb)"
    fi

    if [ -z $(which ag) ]; then
        echo "Installing ag"
        brew install the_silver_searcher
    fi

    if [ $(which npm) ]; then
        if [ -z $(which eslint) ]; then
            echo "Installing eslint"
            npm install -g eslint
        fi
    else
        echo "npm not found, the following packages weren't installed."
        echo "ESLint: https://github.com/eslint/eslint"
    fi
fi
