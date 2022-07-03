#!/bin/bash

# Input
read -p "Enter username you want to create: " username
read -p "Enter your password: "$'\n' -s password

# fail on error and report it, debug all lines
set -eu -o pipefail 

apt-get update
# apt-get upgrade -y

# Set timezone to Asia/Bangkok
timedatectl set-timezone Asia/Bangkok

echo "Create new user"
# quietly add a user without password
adduser --quiet --disabled-password --gecos GECOS ${username}
# set password
echo "${username}:${password}" | chpasswd

# adduser --gecos GECOS ${username}
# adduser --disabled-password --gecos "" ${username}

echo "Granting Administrative Privileges"
usermod -aG sudo ${username}

echo "Replicate ssh from root"
rsync --archive --chown=${username}:${username} ~/.ssh /home/${username}

echo "Switching User" 
touch /home/${username}/.sudo_as_admin_successful   # To avoid promtp `See "man sudo_root" for details...`
su ${username}