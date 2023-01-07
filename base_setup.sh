#!/bin/zsh

# install xcode command-line-tools
printf "\n\n🛠️  install xcode command-line tools\n"
xcode-select --install

printf "\n\n🛠️  install rosetta 2\n"
echo "A" | softwareupdate --install-rosetta

printf "🛠️  base setup is finished!\n"