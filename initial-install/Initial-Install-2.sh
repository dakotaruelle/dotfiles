#!/bin/bash

CHEZMOI_PATH="/home/dakota/bin/chezmoi"
CHEZMOI_CONFIG_PATH="/home/dakota/.config/chezmoi/chezmoi.yaml"

### Install chezmoi
if ( test -f $CHEZMOI_PATH )
then
  printf "\n-----  chezmoi already installed  -----\n"
else
  printf "\n-----  Installing chezmoi...  -----\n"
  sh -c "$(curl -fsLS chezmoi.io/get)"
  touch $CHEZMOI_CONFIG_PATH
  echo "data:" >> $CHEZMOI_CONFIG_PATH
  echo "  name: home-computer" >> $CHEZMOI_CONFIG_PATH
  bin/chezmoi init --apply git@github.com:dakotaruelle/dotfiles.git
fi

if [ -d /home/linuxbrew ]; then
    printf "\n-----  HomeBrew already installed  -----\n"
else
    printf "\n-----  Installing HomeBrew...  -----\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    printf "\n-----  Adding HomeBrew to path...  -----\n"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh
