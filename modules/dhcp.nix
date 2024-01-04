# DHCP Network Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable DHCP Networking
  networking.networkmanager.enable = true;

}
