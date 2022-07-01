#!/bin/bash

# fail on error and report it, debug all lines
set -eu -o pipefail 

apt-get update && apt-get upgrade -y

# Set timezone to Asia/Bangkok
timedatectl set-timezone Asia/Bangkok

# Create new user
adduser bai

# Granting Administrative Privileges
usermod -aG sudo bai

# Replicate ssh from root
rsync --archive --chown=bai:bai ~/.ssh /home/bai

su bai
sleep 5

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo apt install -y docker-compose

sudo apt-get install git -y

sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 22
sudo ufw allow 2222
sudo ufw enable

#---- powerline font installation
mkdir -p $HOME/downloads
cd $HOME/downloads
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
bash ./install.sh
cd ..
rm -rf fonts
sudo sed -i 's/FONTFACE="Fixed"/FONTFACE="DejaVu Sans Mono for Powerline"/g' /etc/default/console-setup
sudo sed -i 's/FONTFACE="DejaVu Sans Mono for Powerline"/FONTFACE="Fixed"/g' /etc/default/console-setup
cd
#----


#---- nvim installation
sudo apt-get install neovim -y

# Create folder in not exist
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

cp ./nvim-init.conf $HOME/.config/nvim/init.vim
#----