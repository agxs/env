#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
fi

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
else
  cd "$HOME/.vim/bundle/vundle"
  git pull
fi

ln -sf $HOME/src/env/bashrc $HOME/.bashrc_as
ln -sf $HOME/src/env/vimrc $HOME/.vimrc
ln -sf $HOME/src/env/vimrc.bundles $HOME/.vimrc.bundles
ln -sf $HOME/src/env/inputrc $HOME/.inputrc
ln -sf $HOME/src/env/zshrc $HOME/.zshrc
ln -sf $HOME/src/env/agxs.zsh-theme $HOME/.oh-my-zsh/themes/agxs.zsh-theme
ln -sf $HOME/src/env/vagrant.plugin.zsh $HOME/.oh-my-zsh/plugins/vagrant/vagrant.plugin.zsh
ln -sf $HOME/src/env/tmux.conf $HOME/.tmux.conf
if [[ -d "$HOME/.irssi" ]]; then
  ln -sf $HOME/src/env/solarized-universal.theme $HOME/.irssi/solarized-universal.theme
  ln -sf $HOME/src/env/irssi_config $HOME/.irssi/config
fi

# Sets up gnome-terminal
if [ -e "`which gconftool-2`" ]; then
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
#  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#000000000000"
#  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#838394949696"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#00002b2b3636"
  gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#838394949696"
fi

vim -u "$HOME/.vimrc.bundles" +BundleInstall! +BundleClean +qall

