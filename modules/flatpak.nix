# Flatpak Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable Flatpak Service.
  services = {
    flatpak = {
      enable = true;
    };
  };

  # A portal frontend service for Flatpak and other desktop containment frameworks.
  xdg = {
    portal = {
      enable = true;
    };
  };

}