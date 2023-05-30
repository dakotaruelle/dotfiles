# Setup and Configuration

## Ubuntu

### Initial Setup

1. Download this repo
2. Add .ssh folder and keys
3. Run `bash initial-install/Initial-Install-1.sh`
4. Restart the shell (for newly installed tools/apps)
5. Run `bash initial-install/Initial-Install-2.sh`
6. Logout and log back in (for default shell to change)
7. Create a chezmoi config file at `~/.config/chezmoi/chezmoi.yaml` 

    (for example)
   
       edit:
        command: code

       git:
         autoCommit: true
         autoPush: true

       data:
         name: work-computer

8. Run the command `bin/chezmoi init --apply dakotaruelle`

### Normal Usage

Run the command `chezmoi update`. This will

- Update any dotfiles/config files
- Update all apt packages
- Update all snap packages
- Update all homebrew packages