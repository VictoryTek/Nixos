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
echo -e "+                You are attempting to Update                     +"   
echo -e "+                                                                 +"
echo -e "+                             Nixos                               +"
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

# install git
function git() {
	sudo nix-shell -p git
	echo
	echo "Git installed in this shell"
	echo
    check_exit_status
}

# download from github
function download() {
	sudo git clone https://github.com/victorytek/victorynixos
	echo
	echo "NixOS modules downloaded"
	echo
    check_exit_status
}

# make and move
function move() {
    echo
	sudo mkdir /etc/nixos/modules
	echo
    sudo mkdir /etc/nixos/modules/de    
    sudo mkdir /etc/nixos/modules/installs
    sudo mkdir /etc/nixos/modules/network
    sudo mkdir /etc/nixos/modules/services
    sudo mkdir /etc/nixos/modules/system
	echo
    sudo mv -i ~/VictoryNixos/modules/gnome.nix /etc/nixos/modules/de
    sudo mv -i ~/VictoryNixos/modules/packages.nix /etc/nixos/modules/installs
    sudo mv -i ~/VictoryNixos/modules/virtualbox-ga.nix /etc/nixos/modules/installs
    sudo mv -i ~/VictoryNixos/modules/dhcp.nix /etc/nixos/modules/network
    sudo mv -i ~/VictoryNixos/modules/static.nix /etc/nixos/modules/network
    sudo mv -i ~/VictoryNixos/modules/docker.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/podman.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/podman.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/plex.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/jellyfin.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/print.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/smb.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/sound.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/ssh.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/traefik.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/qemu_kvm.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/virtualbox.nix /etc/nixos/modules/services
    sudo mv -i ~/VictoryNixos/modules/cleanup.nix /etc/nixos/modules/system
    sudo mv -i ~/VictoryNixos/modules/flakes-enabled.nix /etc/nixos/modules/system
    sudo mv -i ~/VictoryNixos/modules/nur.nix /etc/nixos/modules/system
    sudo mv -i ~/VictoryNixos/modules/users.nix /etc/nixos/modules/system
	echo
	echo "NixOS modules have been placed"
	echo
    check_exit_status
}

# Change configs and activate modules
function config() {
    sudo cp -r /etc/nixos/configuration.nix /etc/nixos/configuration.nix.old
    echo
	sudo rm -rf /etc/nixos/configuration.nix
    echo
    sudo mv -i ~/VictoryNixos/configuration.nix /etc/nixos
	echo
    sudo nano configuration.nix
    echo
	echo "NixOS configuration has been changed and configured."
	echo
    check_exit_status
}

# Stop the running container
function update() {
	sudo nix-channel --update
	echo
	echo "Stable Channel Updated"
	echo
    check_exit_status
}

# Remove the container
function upgrade() {
	sudo nixos-rebuild switch
	echo
	echo "Nixos updated"
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
git
download
move
config
#update
#upgrade
#reboot