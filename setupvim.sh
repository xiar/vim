#!/usr/bin/env bash

set +x 

# create autoload to hold all vim plugins
if [ ! -d $HOME/.vim/autoload ];then
    mkdir -p $HOME/.vim/autoload
fi

if [ ! -d $HOME/.vim/bundle ];then
    mkdir -p $HOME/.vim/bundle
fi

# first clone pathogen
if [ ! -f $HOME/.vim/autoload/pathogen.vim ];then
    git clone https://github.com/tpope/vim-pathogen.git /tmp/pathogen
    cp -f /tmp/pathogen/autoload/pathogen.vim $HOME/.vim/autoload
fi


COLOR_PATH=$HOME/.vim/colors
PACKAGE_PATH=$HOME/.vim/bundle

if [ ! -d $COLOR_PATH ];then
    mkdir -p $COLOR_PATH
fi
# clone monokai
#if [ ! -d $PACKAGE_PATH/vim-monokai ];then
#    git clone https://github.com/sickill/vim-monokai.git $PACKAGE_PATH/vim-monokai
#fi

echo "Molokai"
if [ ! -d $PACKAGE_PATH/molokai ];then
    git clone https://github.com/tomasr/molokai.git $PACKAGE_PATH/molokai
    cp $PACKAGE_PATH/molokai/colors/*.vim $HOME/.vim/colors
fi

echo "tagbar"
# add tagbar
if [ ! -d $PACKAGE_PATH/tagbar ];then
    git clone https://github.com/preservim/tagbar.git $PACKAGE_PATH/tagbar
fi
# add tagbar

echo "vim-mark"
# add vim-mark
if [ ! -d $PACKAGE_PATH/vim-mark-1.1.8 ];then
    #git clone https://github.com/inkarkat/vim-mark.git $PACKAGE_PATH/vim-mark
    wget -q https://github.com.cnpmjs.org/inkarkat/vim-mark/archive/1.1.8.tar.gz -O /tmp/vim-mark.tar.gz
    [ -f /tmp/vim-mark.tar.gz ] && tar -zxvf /tmp/vim-mark.tar.gz -C $PACKAGE_PATH/
fi

echo "taglist"
# add taglist
if [ ! -d $PACKAGE_PATH/taglist ];then
    git clone https://github.com/vim-scripts/taglist.vim.git $PACKAGE_PATH/taglist
fi

echo "vim-fugitive"
if [ ! -d $PACKAGE_PATH/vim-fugitive ];then
    git clone https://github.com/tpope/vim-fugitive ${PACKAGE_PATH}/vim-futitive
fi

echo "vim-gitgutter"
if [ ! -d $PACKAGE_PATH/vim-gitgutter ];then
    git clone https://github.com/airblade/vim-gitgutter $PACKAGE_PATH/vim-gitgutter
fi

echo "vim-airline"
if [ ! -d $PACKAGE_PATH/vim-airline ];then
    git clone https://github.com/vim-airline/vim-airline $PACKAGE_PATH/vim-airline
fi

echo "tmuxline"
if [ ! -d $PACKAGE_PATH/tmuxline ];then
    git clone https://github.com/edkolev/tmuxline.vim $PACKAGE_PATH/tmuxline
fi

echo "NERDTree"
if [ ! -d $PACKAGE_PATH/nerdtree ];then
    git clone https://github.com/preservim/nerdtree $PACKAGE_PATH/nerdtree
fi

echo "YouCompleteMe"
if [ ! -d $PACKAGE_PATH/YouCompleteMe ];then
    git clone https://github.com/Valloric/YouCompleteMe.git ${PACKAGE_PATH}/YouCompleteMe
    pushd $PACKAGE_PATH/YouCompleteMe
    git submodule update --init
    pushd third_party/ycmd
    git submodule update --init --recursive
    popd
    ./install.sh --clang-completer
    if [ !-f ~/.vim/.ycm_extra_conf.py ];then
        cp ./third_party/ycmd/.ycm_extra_conf.py ~/.vim
    fi
    if [ ! -h /usr/bin/python ];then
        ln -s /usr/bin/python3 /usr/bin/python
    fi
    popd
fi
