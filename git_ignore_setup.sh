#!/bin/bash
# 출처(참조): https://philographer.github.io/development/gitignore-ds-store/

# global setting
printf "\n\n🤚  set .gitignore global\n"
echo ".DS_Store" >> ~/.gitignore_global
echo "._.DS_Store" >> ~/.gitignore_global
echo "**/.DS_Store" >> ~/.gitignore_global
echo "**/._.DS_Store" >> ~/.gitignore_global

git config --global core.excludesfile ~/.gitignore_global

printf "🤚  global ignore setup is finished!\n"