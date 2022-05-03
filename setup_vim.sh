#!/bin/bash

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
else
  cd "$HOME/.vim/bundle/vundle"
  git pull
fi

ln -sf $HOME/src/env/vimrc $HOME/.vimrc
ln -sf $HOME/src/env/vimrc.bundles $HOME/.vimrc.bundles

vim -u "$HOME/.vimrc.bundles" +BundleInstall! +BundleClean +qall
