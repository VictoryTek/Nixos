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
echo -e "+                 You are attempting to Setup                     +"   
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
	sudo mkdir /etc/nixos/secrets
	echo
    sudo mv -i /home/$USER/VictoryNixos/modules/gnome.nix /etc/nixos/modules/de
	sudo mv -i /home/$USER/VictoryNixos/modules/gnome_extensions.nix /etc/nixos/modules/installs
    sudo mv -i /home/$USER/VictoryNixos/modules/packages.nix /etc/nixos/modules/installs
    sudo mv -i /home/$USER/VictoryNixos/modules/virtualbox-ga.nix /etc/nixos/modules/installs
    sudo mv -i /home/$USER/VictoryNixos/modules/dhcp.nix /etc/nixos/modules/network
    sudo mv -i /home/$USER/VictoryNixos/modules/static.nix /etc/nixos/modules/network
    sudo mv -i /home/$USER/VictoryNixos/modules/flatpak.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/docker.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/podman.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/plex.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/jellyfin.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/print.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/smb.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/sound.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/ssh.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/tailscale.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/traefik.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/qemu_kvm.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/virtualbox.nix /etc/nixos/modules/services
    sudo mv -i /home/$USER/VictoryNixos/modules/cleanup.nix /etc/nixos/modules/system
    sudo mv -i /home/$USER/VictoryNixos/modules/flakes-enabled.nix /etc/nixos/modules/system
    sudo mv -i /home/$USER/VictoryNixos/modules/nur.nix /etc/nixos/modules/system
    sudo mv -i /home/$USER/VictoryNixos/modules/users.nix /etc/nixos/modules/system
    sudo mv -i /home/$USER/VictoryNixos/update.sh /home/$USER/Documents
    sudo mv -i /home/$USER/VictoryNixos/Version_Upgrade.sh /home/$USER/Documents
    sudo mv -i /home/$USER/VictoryNixos/modules/smb-data /etc/nixos/secrets
    sudo mv -i /home/$USER/VictoryNixos/modules/smb-mydata /etc/nixos/secrets
	echo
	echo "NixOS modules have been placed"
	echo
    check_exit_status
}  

# Stop the running container
function secrets() {
	echo
	sudo chmod 0600 /etc/nixos/secrets/smb-data
	sudo chmod 0600 /etc/nixos/secrets/smb-mydata
	echo
	sudo mv /etc/nixos/secrets /etc/nixos/.secrets
	echo
    check_exit_status
}

# Change configs and activate modules
function config() {
    sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.old
    echo
    sudo mv -i ~/VictoryNixos/configuration.nix /etc/nixos
	echo
	sleep 3s
	echo
    sudo nano /etc/nixos/configuration.nix
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
	shutdown --reboot 1
    echo
	echo "Rebooting in 1 minute"
    echo
    sleep 90
	echo
    check_exit_status
}


greeting	
move
secrets
config
update
upgrade
reboot