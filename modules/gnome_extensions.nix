# Gnome Extensions Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable Gnome Extensions.
  environment.systemPackages = [
    # Install Tiling Assistant exxtension
    pkgs = {
        gnomeExtensions = {
            tiling-assistant;
        };
    };
  ];

}