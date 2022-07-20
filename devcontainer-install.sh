#!/bin/bash

mv -f $HOME/dotfiles/* $HOME/

# Install chezmoi
sh -c "$(curl -fsLS chezmoi.io/get)"
touch $HOME/.config/chezmoi/chezmoi.yaml
echo "data:" >> $HOME/.config/chezmoi/chezmoi.yaml
echo "  name: work-computer" >> $HOME/.config/chezmoi/chezmoi.yaml

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install oh-my-posh
brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh

# Init
bin/chezmoi init --apply git@github.com:dakotaruelle/dotfiles.git