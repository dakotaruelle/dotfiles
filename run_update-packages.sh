#!/bin/bash

printf "\n\n   ---Updating all apt packages---   \n\n"
sudo apt update
sudo apt upgrade -y
sudo apt autoremove

printf "\n\n   ---Updating all snap packages---   \n\n"
sudo snap refresh

printf "\n\n   ---Updating all homebrew packages---   \n\n"
brew update
brew upgrade