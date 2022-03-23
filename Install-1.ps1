param([String] $installProfile="personal")

Write-Output "--- Beginning install process ---"

# Write-Output "Enabling execution of Powershell scripts"
# Set-ExecutionPolicy RemoteSigned

### Install all programs
# winget install

### install wsl
# wsl --install

# Write-Output "Installing global npm packages..."
# npm install -g @bitwarden/cli

### Customize taskbar 
# Import-StartLayout -LayoutPath "taskbar-layout.xml" -MountPath "C:\"

### Set the timezone
# tzutil /s "Central Standard Time"

### Bitwarden
# bw login

### SSH
# create .ssh folder
# get public key from bw and put it into id_rsa.pub
# get privaet key from bw and put int into id_rsa

### Set git username and password

### Chezmoi
# Set-ExecutionPolicy Unrestricted -Scope Process
# (iwr -UseBasicParsing https://chezmoi.io/get.ps1).Content | powershell -c -
# add chezmoi to path
#chezmoi init git@github.com:dakotaruelle/dotfiles.git

## Install Nerd Font
## https://www.nerdfonts.com/font-downloads
