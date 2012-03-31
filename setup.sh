#!/bin/bash

rm $HOME/.bashrc_as \
   $HOME/.vimrc \
   $HOME/.inputrc \
   $HOME/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml

ln -s $HOME/src/env/bashrc $HOME/.bashrc_as
ln -s $HOME/src/env/vimrc $HOME/.vimrc
ln -s $HOME/src/env/inputrc $HOME/.inputrc
ln -s $HOME/src/env/%gconf.xml \
      $HOME/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml

