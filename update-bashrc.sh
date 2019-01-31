#!/bin/bash

echo "if [ -n \"\$PS1\" ]; then
  exec zsh
fi" >> $HOME/.bashrc

