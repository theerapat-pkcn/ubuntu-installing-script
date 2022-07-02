#!/bin/bash

# ======================== Note ============================
# Suppose that a user name john@... try to run this script
# under sudo command like `sudo bash script.sh` and when
# he run the script without sudo `bash script.sh`. Some
# command in script like `mkdir` will behave differently
# even the folder is created on both command. First
# with sudo will result in root is owner of that folder
# but second command will result in john is owner.
# This also affects to variable like $USER, $HOME, which is
# not something we want.
# To solve the problem, instead of run command directly by 
# this script. This script will check for the username that 
# run the script and run another script name "user-run"
# under `sudo -u` to ensure that command like `mkdir`
# must run under that user not root by sudo privilege
# ===========================================================


#---- Get username whether run via sudo or not
if [ -z ${SUDO_USER} ];
	then user=$USER;
	else user=$SUDO_USER;
fi
#----

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo -u $user bash "${SCRIPT_DIR}/user-run"