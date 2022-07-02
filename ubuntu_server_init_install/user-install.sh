#!/bin/bash

#(v) Running script folder path
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "===== Check Privileges ====="
sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"


echo "===== Installing docker ====="
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo apt install -y docker-compose

echo "===== Installing git ====="
sudo apt-get install git -y

#---- powerline font installation
echo "===== Installing Powerline-fonts ====="
mkdir -p $HOME/downloads
git clone --depth=1 https://github.com/powerline/fonts.git $HOME/downloads
bash $HOME/downloads/fonts/install.sh
rm -rf $HOME/downloads/fonts
# Replace original font setting
sudo sed -i 's/FONTFACE="Fixed"/FONTFACE="DejaVu Sans Mono for Powerline"/g' /etc/default/console-setup
#----


#---- Install vim-plug for nvim
echo "===== Install vim-plug ====="
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#----


#---- nvim installation
echo "===== Installing nvim ====="
sudo apt-get install neovim -y

# Create folder if not exist
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

cp $SCRIPT_DIR/nvim-init.conf $HOME/.config/nvim/init.vim
#----


echo "===== Installing ufw ====="
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 22
sudo ufw allow 2222
sudo ufw enable