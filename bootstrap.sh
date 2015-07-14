#!/bin/bash

set -ui

if brew --version 2>/dev/null; then
  echo 'Brew already installed'
else
  echo 'Installing brew'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if brew cask --version 2>/dev/null; then
  echo 'Caskroom already installed'
else
  echo 'Installing Caskroom'
  brew install caskroom/cask/brew-cask
  echo 'Updating brew Recipes'
  brew update
fi


echo 'Run install script'
ruby install.rb

echo 'setting up tmux'
curl -L https://gist.githubusercontent.com/kunday/8854661/raw/f06d63dbbea700ebb95866c3fb8933abf3bfca0c/.tmux.conf > ~/.tmux.conf

echo 'setting up git config'
curl -L https://gist.githubusercontent.com/kunday/665224/raw/c7dfdf90ee8943630b0003d2dcea2a4396ec8596/.gitconfig > ~/.gitconfig

git config --global user.name "Arv Kunday"
git config --global user.email "mail@kunday.com"
