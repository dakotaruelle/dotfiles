#!/bin/bash

# Install chezmoi
echo "Installing chezmoi..."
sh -c "$(curl -fsLS chezmoi.io/get)"
bin/chezmoi init --apply git@github.com:dakotaruelle/dotfiles.git

echo "Checking for HomeBrew installation..."
if [ -d /home/linuxbrew ]; then
    echo "HomeBrew is already installed"
else
    echo "Installing HomeBrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    echo "Adding HomeBrew to path..."
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh
