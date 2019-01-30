#!/bin/bash

echo "if [ -n \"\$PS1\" ]; then
  zsh
  exit
fi" >> $HOME/.bashrc

