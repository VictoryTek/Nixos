#!/usr/bin/env bash
# Version upgrade script for NixOS
# Ver. 1.3

#####################################################################
#  ____    ____  __                                                 #
#  \   \  /   / |__| ____ ________    ____    _______ ___  ___      #
#   \   \/   /  ___ |   _|\__   __\ /   _  \ |  __   |\  \/  /      #
#    \      /  |   ||  |_   |  |   |   |_|  ||  | |__| \   /        #
#     \____/   |___||____|  |__|    \_____ / |__|       |_|         #
#                                                                   #
# Victory Tek Install script                                        #
# https://github.com/Victorytek                                     #
#####################################################################



# Make sure each command executes properly
clear
check_exit_status() {

	if [ $? -eq 0 ]
	then
		echo
		echo "Success"
		echo
	else
		echo
		echo "[ERROR] Update Failed! Check the errors and try again"
		echo
		
		read -p "The last command exited with an error. Exit script? (y/n) " answer

            if [ "$answer" == "y" ]
            then
                exit 1
            fi
	fi
}

function greeting() {

echo -e "+-----------------------------------------------------------------+"
echo -e "            Hello, $USER. Welcome to Victory Update.               "
echo -e "+                                                                 +"
echo -e "+            You are attempting to Version Upgrade                +"   
echo -e "+                                                                 +"
echo -e "+                             NixOS                               +"
echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

#	sleep 5s
	echo "ARE YOU READY TO START? [y,n]"
	read input

	# did we get an input value?
	if [ "$input" == "" ]; then

	   echo "Nothing was entered by the user"

	# was it a y or a yes?
	elif [[ "$input" == "y" ]] || [[ "$input" == "yes" ]]; then

	   echo "You replied $input, you are ready to start"
	   echo
	   echo "Starting NixOS Version Upgrade script."
	   echo
	   sleep 3s

	# treat anything else as a negative response
	else

	   echo "You replied $input, you are not ready"
	   echo
	   exit 1

fi

	echo
	
	check_exit_status
}

# Change to the new stable branch
function update() {
    echo "What version of NixOS are we Upgrading to?"
    echo
    read -p 'nixos-' version
    echo
    echo "You want to upgrade to nixos-$version? [y,n]"
    read input

	# did we get an input value?
	if [ "$input" == "" ]; then

	   echo "Nothing was entered by the user"

	# was it a y or a yes?
	elif [[ "$input" == "y" ]] || [[ "$input" == "yes" ]]; then

	   echo "You replied $input, you are ready to start"
	   echo
	   echo "Starting NixOS Version Upgrade script."
	   echo
	   sleep 3s

	# treat anything else as a negative response
	else

	   echo "You replied $input, you are not ready"
	   echo
	   exit 1

fi

	echo
	sudo nix-channel --add https://channels.nixos.org/nixos-$version nixos
	echo
	echo "Stable Channel Updated"
	echo
    check_exit_status
}

# List the branch
function list() {
	sudo nix-channel --list | grep nixos
	echo
	echo "Current branch listed"
	echo
    echo "Is this the version you want to upgrade to? [y,n]"
	read input

	# did we get an input value?
	if [ "$input" == "" ]; then

	   echo "Nothing was entered by the user"

	# was it a y or a yes?
	elif [[ "$input" == "y" ]] || [[ "$input" == "yes" ]]; then

	   echo "You replied $input, Let's upgrade NixOS"
	   echo
	   echo "Starting NixOS Version Upgrade."
	   echo
	   sleep 3s

	# treat anything else as a negative response
	else

	   echo "You replied $input, you are not ready"
	   echo
	   exit 1

fi

	echo
	
	check_exit_status
}

# Remove the container
function upgrade() {
	sudo nixos-rebuild switch --upgrade
	echo
	echo "Nixos updated"
	echo
    check_exit_status
}

# Remove the old image
function reboot() {
    echo "Do you want to restart? [y,n]"
	read input

	# did we get an input value?
	if [ "$input" == "" ]; then

	   echo "Nothing was entered by the user"

	# was it a y or a yes?
	elif [[ "$input" == "y" ]] || [[ "$input" == "yes" ]]; then

	   echo "You replied $input, rebooting"
	   echo
	   sleep 3s

	# treat anything else as a negative response
	else

	   echo "You replied $input, not rebooting"
	   echo
	   exit 1

fi

	echo
	sudo shutdown --reboot 1
    echo
	echo "Rebooting in 1 minute"
    echo
    sleep 90
	echo
    check_exit_status
}



greeting	
update
list
upgrade
#reboot