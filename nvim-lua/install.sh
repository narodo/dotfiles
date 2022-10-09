#!/usr/bin/sh

CONFIG=~/.config/

#rm -rf $NVIM

#mkdir -p $CONFIG/share
mkdir -p $CONFIG/nvim

stow --restow --target=$CONFIG/nvim nvim

#alias nvb='XDG_DATA_HOME=$NVIM/share XDG_CONFIG_HOME=$NVIM nvim' 

#export nvb
