#!/bin/bash

# Create links to all the dotfiles in the home directory
ln -s ./.bashrc ~/.bashrc
ln -s ./.zshrc ~/.zshrc
ln -s ./.p10k.zsh ~/.p10k.zsh

# Set default shell to zsh
sudo chsh -s $(which zsh) $(whoami)