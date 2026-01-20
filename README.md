# Dotfiles

## Quick Start (Ubuntu)
On a fresh Ubuntu installation, run:

```bash
cd ~
git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git)
cd dotfiles
./setup.sh
```

## Maintenance

I use a custom command dotsync to keep everything updated.

    Sync everything: Simply type dotsync "Description of changes"

    Add a new app:

        Create a folder: mkdir -p ~/dotfiles/appname/.config/appname

        Move your config into it.

        Run stow appname from the ~/dotfiles directory.

## Portability

The .aliases file contains conditional logic to handle differences between Linux and macOS. To use on a Mac, clone the repo and stow shell to get your .zshrc and .aliases instantly.

