#!/bin/bash

# isInitialRun=$1

# if [ $isInitialRun ]; then
# fi

# Upgrade default packages
echo "Upgrading default packages..."
sudo apt update
sudo apt upgrade -y

# Install Packages
echo "Installing packages..."
sudo apt install gcc -y
sudo apt install zsh -y
sudo chsh -s $(which zsh)

####   Exit and Restart Shell   ####

echo "Checking for HomeBrew installation..."
if [ -d ~/.linuxbrew ]; then
    echo "HomeBrew is already installed"
else
    echo "Installing HomeBrew..."
    sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [ (brew ls --versions oh-my-posh) ]; then
    echo "here"
fi

brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh

# chezmoi apply