#!/bin/bash

# Create links to all the dotfiles in the home directory
ln -s $(pwd)/.bashrc ~/.bashrc
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.p10k.zsh ~/.p10k.zsh
# Create links to nvim config files
ln -s $(pwd)/apps/nvim/astro-nvim ~/.config/nvim
ln -s $(pwd)/apps/nvim/custom/extend-astro-nvim $(pwd)/apps/nvim/astro-nvim/lua/user

# Create alacritty links
ln -s $(pwd)/apps/alacritty ~/.config/alacritty

# Set default shell to zsh
sudo chsh -s $(which zsh) $(whoami)