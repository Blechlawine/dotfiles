#!/bin/bash

# Create links to all the dotfiles in the home directory
ln -s "$(pwd)/.bashrc" ~/.bashrc
ln -s "$(pwd)/.zshrc" ~/.zshrc
ln -s "$(pwd)/.p10k.zsh" ~/.p10k.zsh
# Create links to nvim config files
echo "Which Neovim Configuration do you want to link?"
echo "1 = Astro-nvim"
echo "2 = NvChad"
echo "3 = Blechvim"
read -r nvim_config_index
# If there is already a nvim config directory, rename it to "nvim_old"
if [ -f ~/.config/nvim ]; then
    if [ -L ~/.config/nvim ]; then
        rm ~/.config/nvim
    else
        mv ~/.config/nvim ~/.config/nvim_old
    fi
fi

if [ "$nvim_config_index" == 1 ]; then
    ln -s $(pwd)/apps/nvim/astro-nvim ~/.config/nvim
    ln -s $(pwd)/apps/nvim/custom/extend-astro-nvim $(pwd)/apps/nvim/astro-nvim/lua/user
elif [ "$nvim_config_index" == 2 ]; then
    ln -s $(pwd)/apps/nvim/NvChad ~/.config/nvim
    ln -s $(pwd)/apps/nvim/custom/extend-nvchad $(pwd)/apps/nvim/NvChad/lua/custom
elif [ "$nvim_config_index" == 3 ]; then
    ln -s $(pwd)/apps/nvim/blechvim ~/.config/nvim
fi

# Create alacritty links
ln -s $(pwd)/apps/alacritty ~/.config/alacritty

# Set default shell to zsh
sudo chsh -s "$(which zsh)" "$(whoami)"
