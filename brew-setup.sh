#!/bin/bash

# install Homebrew
printf "\n\n🍻 search Homebrew\n"
if ! which brew
    then
        printf "\n\n🍻 install Homebrew\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/${USER}/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# get Brewfile
printf "\n\n🍻 get BrewFile\n"
curl -s -O https://raw.githubusercontent.com/terria1020/my-brew-env/main/brew_bundle/Brewfile

# run brew bundle
printf "\n\n🍻 run brew bundle\n"
brew bundle

# cleanup
printf "\n\n🍻 cleanup\n"
rm Brewfile

printf "\n\n🍻 setup is finished!\n"