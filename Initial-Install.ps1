param([String] $installProfile = "personal")

Write-Output "--- Beginning install process ---"

### Install all programs
Write-Output "Installing programs..."
winget import --import-file ./winget-packages.json --ignore-unavailable --ignore-versions --accept-package-agreements --accept-source-agreements --verbose-logs

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
Write-Output "Verifying fonts..."

function Install-Font {
  param (
    $FontName
  )

  if (-not(Test-Path ("$($env:windir)\Fonts\" + $FontName))) {
    Write-Output "Installing font"
    
    try { 
      Copy-Item -Path $HOME\.fonts\$FontName -Destination ("$($env:windir)\Fonts\" + $FontName) -Force 
      New-ItemProperty -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $FontName -Force -ErrorAction SilentlyContinue | Out-Null  
    }
    catch {            
      Write-Host "Error installing font: $FontName. " $_.exception.message
    }
  }
  else {
    Write-Output ($FontName + " is already installed")
  }
}

echo "Installing font family MesloLGS NF"
Install-Font -FontName "Meslo LG S Regular Nerd Font Complete Windows Compatible.ttf"
Install-Font -FontName "Meslo LG S Italic Nerd Font Complete Windows Compatible.ttf"
Install-Font -FontName "Meslo LG S Bold Nerd Font Complete Windows Compatible.ttf"
Install-Font -FontName "Meslo LG S Bold Italic Nerd Font Complete Windows Compatible.ttf"

