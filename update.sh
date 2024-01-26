#!/usr/bin/env bash
# Docker Update script for NixOS
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
echo -e "            Hello, $USER. Welcome to Victory Scripts.              "
echo -e "+                                                                 +"
echo -e "+                You are attempting to Update                     +"   
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
	   echo "Starting NixOS Update script."
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

# Sync with the update channel
function channel() {
	sudo nix-channel --update
	echo
	echo "Stable Channel Updated"
	echo
    check_exit_status
}

# Update
function update() {
	sudo nixos-rebuild switch
	echo
	echo "Nixos updated"
	echo
    check_exit_status
}

# Reboot automatically
function auto_reboot() {
	echo
	shutdown --reboot 1
    echo
	echo "Rebooting in 1 minute"
    echo
    sleep 90
	echo
    check_exit_status
}

# Reboot
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
channel
update
#auto_reboot
reboot