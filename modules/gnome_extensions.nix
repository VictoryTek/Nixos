# Gnome Extensions Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable Gnome Extensions.
   environment.systemPackages = [
    pkgs.gnomeExtensions.tiling-assistant
  ];

}