# Packages Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable Non-Free software
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Packages to be Installed.
  environment = {
    systemPackages = with pkgs; [
      #Browsers
      brave
      firefox
      #Utilities
      cifs-utils
      grsync
      htop
      inxi
      iproute2
      killall
      neofetch
      ntfs3g
      terminator
      git
      packagekit
      python3
      unzip
      wget
      zip
      ];
  };

}
