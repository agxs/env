#!/bin/bash

rm $HOME/.bashrc_as \
   $HOME/.vimrc.local \
   $HOME/.inputrc \
   $HOME/.irssi/solarized-universal.theme \
   $HOME/.irssi/config \
   $HOME/.zshrc \
   $HOME/.tmux.conf \
   $HOME/.oh-my-zsh/themes/agxs.zsh-theme

ln -s $HOME/src/env/bashrc $HOME/.bashrc_as
ln -s $HOME/src/env/vimrc.local $HOME/.vimrc.local
ln -s $HOME/src/env/inputrc $HOME/.inputrc
ln -s $HOME/src/env/solarized-universal.theme $HOME/.irssi/solarized-universal.theme
ln -s $HOME/src/env/irssi_config $HOME/.irssi/config
ln -s $HOME/src/env/zshrc $HOME/.zshrc
ln -s $HOME/src/env/agxs.zsh-theme $HOME/.oh-my-zsh/themes/agxs.zsh-theme
ln -s $HOME/src/env/tmux.conf $HOME/.tmux.conf

# Sets up gnome-terminal
if [ -n "`which gconftool-2`" ]; then
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
#  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#000000000000"
#  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#838394949696"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#00002b2b3636"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#838394949696"
fi

