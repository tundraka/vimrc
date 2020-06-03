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
    "https://github.com/scrooloose/nerdtree"
    "https://github.com/itchyny/lightline.vim"
    "https://github.com/easymotion/vim-easymotion"
    "https://github.com/junegunn/fzf"
    "https://github.com/junegunn/fzf.vim"

    # Dev utils
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
    "https://github.com/isRuslan/vim-es6"
    "https://github.com/othree/javascript-libraries-syntax.vim"

    # Themes
    "https://github.com/nanotech/jellybeans.vim"
    "https://github.com/morhetz/gruvbox"
    "https://github.com/junegunn/seoul256.vim"
    "https://github.com/drewtempelmeyer/palenight.vim"

    # Polyglot
    "https://github.com/sheerun/vim-polyglot"
)

REMOVED=(
    "https://github.com/jwalton512/vim-blade"
    "https://github.com/elzr/vim-json"
    "https://github.com/mxw/vim-jsx"
    "https://github.com/mustache/vim-mustache-handlebars"
    "https://github.com/posva/vim-vue"
    "https://github.com/pangloss/vim-javascript"
    "https://github.com/kchmck/vim-coffee-script"
    "https://github.com/drewtempelmeyer/palenight.vim"
    "https://github.com/tfnico/vim-gradle"
    "https://github.com/jparise/vim-graphql"
    "https://github.com/Valloric/YouCompleteMe.git"
    "https://github.com/kien/ctrlp.vim"
    "https://github.com/mileszs/ack.vim"
    "https://github.com/bling/vim-airline"

    "https://github.com/tomtom/tlib_vim"
    "https://github.com/MarcWeber/vim-addon-mw-utils"
    "https://github.com/honza/vim-snippets"
    "https://github.com/SirVer/ultisnips"

    "https://github.com/scrooloose/syntastic"
    "https://github.com/majutsushi/tagbar"

    "https://github.com/dleonard0/pony-vim-syntax"
    "https://github.com/vim-scripts/nginx.vim"
)

# Iterate over the list and clone
echo "Installing plugins"
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
        git clone -q $pluginProject $dirName
    fi
done

echo "Removing plugins"
cd $BUNDLE_DIR

for pluginProject in "${REMOVED[@]}"
do
    dirName=$(basename $pluginProject)
    if [ -d $dirName ]; then
        echo "Removing plugin: $dirName"
        rm -rf $dirName
        cd $OLDPWD
    fi
done

echo "Linking ~/.vimrc to .vimrc"
if [ -z $HOME/.vimrc ]; then
    currentDir=$(pwd)
    ln -s $currentDir/.vimrc $HOME/.vimrc
else
    echo "~/.vimrc already exist, link manually"
fi

#
# tmux configuration
#
echo "Linking ~/.tmux.conf to .tmux.conf"
if [ -z $HOME/.tmux.conf ]; then
    currentDir=$(pwd)
    ln -s $currentDir/.tmux.conf $HOME/.tmux.conf
else
    echo "Unable to link tmux conf."
fi

#
# Installing brew programs
#
if [ $(uname -s) = 'Darwin' ]; then
    if [ -z $(which brew) ]; then
        echo "Installing Homebrew"
        hb="https://raw.githubusercontent.com/Homebrew/install/master/install"
        ruby -e "$(curl -fsSL $hb)"
    fi

    if [ $(which brew) ]; then
        brewPrograms=("fzf" "ripgrep")

        for program in "${brewPrograms[@]}"
        do
            if [ -z $(which $program) ]; then
                echo "Installing ${program}"
                brew install $program
            else
                echo "${program} already installed"
            fi
        done
    else
        echo "brew not installed, several programs weren't installed."
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
