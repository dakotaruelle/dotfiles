param([String] $installProfile = "personal")

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
Write-Output "Checking for necessary font..."
$FontFamilyName = "Hurmit NF"
$FontName = "Hurmit Bold Nerd Font Complete Windows Compatible.otf"
$FontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hermit.zip"
$DownloadsFolderPath = "$HOME\Downloads\"
$FontDownloadPath = $DownloadsFolderPath + $(Split-Path -Path $FontUrl -Leaf)
$FontExtractPath = $DownloadsFolderPath + "UnzippedFontFiles\"
$FontFilePath = $FontExtractPath + $FontName

if (-not(Test-Path ("$($env:windir)\Fonts\" + $FontName))) {
  Write-Output "Downloading font..."
  Invoke-WebRequest -Uri $FontUrl -OutFile $FontDownloadPath
  
  Write-Output "Extracting font..."
  Expand-Archive -Path $FontDownloadPath -DestinationPath $FontExtractPath -Force
  
  Write-Output "Installing font..."
  
  try { 
    Copy-Item -Path $FontFilePath -Destination ("$($env:windir)\Fonts\" + $FontName) -Force 
    New-ItemProperty -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $FontName -Force -ErrorAction SilentlyContinue | Out-Null  
  }
  catch {            
    write-host "Error installing font: $fontFile. " $_.exception.message
  }
}
else {
  Write-Output ($FontFamilyName + " is already installed")
}


    

