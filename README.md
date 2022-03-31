# Setup and Configuration

## Windows

1. Download this repo
2. Add .ssh folder and keys
3. Run this command `Set-ExecutionPolicy RemoteSigned`
4. Run Initial-Install.ps1
5. Run Ubuntu app and go through initial setup prompts
6. Restart Windows Terminal

### WSL
1. Follow above Windows instructions
2. Copy Initial-Install-1.sh and Initial-Install-2.sh to home directory
3. Run this command `/bin/bash Initial-Install-1.sh`
4. Restart shell
5. Add .ssh folder and keys
6. Run this command `/usr/bin/zsh Initial-Install-2.sh`

## Ubuntu