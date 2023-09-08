#!/bin/bash

mkdir ./temp

sudo apt update

# Install cowsay and fortune for zshrc and bashrc
sudo apt install cowsay fortune zsh -y

# Install essential packages
sudo apt install git python3 wget ffmpeg curl -y

# Install firefox
sudo apt install firefox

# Install Evolution through Flathub (requires Flathub to be installed and set up)
flatpak install flathub org.gnome.Evolution

# Install nvim and dependencies/other stuff
# sudo apt install neovim python3-neovim -y
curl -L https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb -o ./temp/nvim-0.8.0-linux64.deb
sudo apt install ./temp/nvim-0.8.0-linux64.deb
# Install required Nerdfonts
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip -o ./temp/FiraCode.zip
unzip ./temp/FiraCode.zip -d ./temp/FiraCode
sudo mkdir /usr/share/fonts/Nerdfonts-FiraCode
sudo cp ./temp/FiraCode/*.ttf /usr/share/fonts/Nerdfonts-FiraCode

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k zsh theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install autojump
cd ~
git clone git://github.com/blechlawine/autojump.git ~/autojump
~/autojump/install.py

# Install vscode and add the repository
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y

# Install Rust stuff
curl https://sh.rustup.rs -sSf | sh

# Install nvm and nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install node # Installs the latest version of nodejs
nvm use node

# Install tldr and yarn
npm install -g tldr yarn

# Enable corepack for yarn 2+
corepack enable
