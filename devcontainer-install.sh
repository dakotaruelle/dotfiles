#!/bin/bash

# Install chezmoi
sh -c "$(curl -fsLS chezmoi.io/get)"

# Add homebrew to path
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install oh-my-posh
brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh
