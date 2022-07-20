#!/bin/bash

# Install chezmoi
sh -c "$(curl -fsLS chezmoi.io/get)"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install oh-my-posh
brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh
