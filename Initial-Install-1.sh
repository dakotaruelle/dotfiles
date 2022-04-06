#!/bin/bash

### Upgrade default packages
echo "Upgrading default packages..."
sudo apt update
sudo apt upgrade -y

### Install Packages
echo "Installing packages..."
sudo apt install gcc zsh -y

### Install nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install --lts

### Configure zsh
echo "Setting zsh as default shell..."
sudo chsh -s $(which zsh)

### Silence daily prompt
echo "Creating .hushlogin file..."
touch ~/.hushlogin