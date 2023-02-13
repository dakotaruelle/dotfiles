#!/bin/bash

NVM_DIR="/home/dakota/.nvm"
HUSH_LOGIN_PATH="/home/dakota/.hushlogin"

## Upgrade default packages
printf "\n-----  Upgrading default packages...  -----\n"
sudo apt update
sudo apt upgrade -y

## Install Packages
printf "\n-----  Installing new packages...  -----\n"
sudo apt install git gcc build-essential libssl-dev curl -y

### Install oh-my-zsh
if ( which zsh )
then
  printf "\n-----  zsh already installed  -----\n"
else
  printf "\n-----  Installing oh-my-zsh...  -----\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

### Install nvm and node
if ( test -d $NVM_DIR )
then
  printf "\n-----  nvm and node already installed  -----\n"
else
  printf "\n-----  Installing nvm and node...  -----\n"

  mkdir -p $NVM_DIR
  export NVM_DIR="$NVM_DIR"
  
  sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  
  export NVM_DIR="$NVM_DIR"
  [ ?-s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  nvm install --lts

fi

### Silence daily prompt
if ( test -f $HUSH_LOGIN_PATH )
then
  printf "\n-----  .hushlogin already exists  -----\n"
else
  printf "\n-----  Creating .hushlogin file  -----\n"
  touch $HUSH_LOGIN_PATH
fi