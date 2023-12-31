#!/bin/bash

## Install ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y curl git software-properties-common ansible

## pull dotfiles and install all the things
sudo ansible-pull -U https://github.com/blechlawine/dotfiles.git