param([String] $installProfile = "personal")

Write-Output "--- Beginning install process ---"

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

### Install wsl
# wsl --install

### Install all programs
Write-Output "Installing programs..."
winget import --import-file ./winget-packages.json --ignore-unavailable --ignore-versions --accept-package-agreements --accept-source-agreements --verbose-logs

### Install Flutter
$FlutterDownloadUrl = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_2.10.4-stable.zip"
$FlutterDownloadPath = "$HOME\Downloads\flutter.zip"
$FlutterInstallPath = "$HOME\bin"
Invoke-WebRequest -Uri $FlutterDownloadUrl -OutFile $FlutterDownloadPath
Expand-Archive -Path $FlutterDownloadPath -DestinationPath $FlutterInstallPath -Force
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + “;$HOME\bin\flutter\bin”, [EnvironmentVariableTarget]::Machine)

### Install global node packages
npm install --global yarn pnpm

### Set the timezone
tzutil /s "Central Standard Time"

## Install Nerd Fonts
Write-Output "Verifying fonts..."

function Install-Font {
  param (
    $FontName
  )

  if (-not(Test-Path ("$($env:windir)\Fonts\" + $FontName))) {
    Write-Output ("Installing font " + $FontName)
    
    try { 
      Copy-Item -Path .\.fonts\$FontName -Destination ("$($env:windir)\Fonts\" + $FontName) -Force 
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

Write-Output "Installing font family MesloLGS NF..."
Install-Font -FontName "Meslo LG S Regular Nerd Font Complete Windows Compatible.ttf"
Install-Font -FontName "Meslo LG S Italic Nerd Font Complete Windows Compatible.ttf"
Install-Font -FontName "Meslo LG S Bold Nerd Font Complete Windows Compatible.ttf"
Install-Font -FontName "Meslo LG S Bold Italic Nerd Font Complete Windows Compatible.ttf"

### Install chocolatey
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

### Chezmoi
choco install chezmoi
chezmoi init --apply git@github.com:dakotaruelle/dotfiles.git

### Create "repos" directory
mkdir repos

### Configure git
Write-Output "Configuring git..."
git config --global user.name "Dakota Ruelle"