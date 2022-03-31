#!/bin/bash

### Upgrade default packages
echo "Upgrading default packages..."
sudo apt update
sudo apt upgrade -y

### Install Packages
echo "Installing packages..."
sudo apt install gcc zsh -y

### Configure zsh
echo "Setting zsh as default shell..."
sudo chsh -s $(which zsh)

### Silence daily prompt
echo "Creating .hushlogin file..."
touch ~/.hushlogin