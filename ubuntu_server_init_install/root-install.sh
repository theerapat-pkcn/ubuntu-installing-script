#!/bin/bash

# fail on error and report it, debug all lines
set -eu -o pipefail 

apt-get update
# apt-get upgrade -y

# Set timezone to Asia/Bangkok
timedatectl set-timezone Asia/Bangkok

echo "Create new user"
#adduser bai
adduser --disabled-password --gecos "" bai

echo "Granting Administrative Privileges"
usermod -aG sudo bai

echo "Replicate ssh from root"
rsync --archive --chown=bai:bai ~/.ssh /home/bai

echo "Switching User" 
touch /home/bai/.sudo_as_admin_successful   # To avoid promtp `See "man sudo_root" for details...`
su bai