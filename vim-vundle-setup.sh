#!/bin/bash

# get Vundle setupfile
printf "\n\n get Vundle setupfile\n"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# get .vimrc
printf "\n\n get basic vimrc for Vundle\n"
printf "\n\n your .vimrc is back-uped to: .vimrc.bak"
mv ~/.vimrc ~/.vimrc.bak
touch ~/.vimrc
printf "`curl -s https://raw.githubusercontent.com/terria1020/my-dev-env/feature-subdivision/vim_vundle/vimrc`" > ~/.vimrc

printf "\n\n setup is finished!\n"
printf "to finish your task, open \"vim\", :PluginInstall execute!\n\n"
