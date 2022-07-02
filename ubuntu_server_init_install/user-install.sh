#!/bin/bash

#---- Get user whether run via sudo or not
if [ -z ${SUDO_USER} ];
	then user=$USER;
	else user=$SUDO_USER;
fi
#----

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo -u $user bash "${SCRIPT_DIR}/user-run"