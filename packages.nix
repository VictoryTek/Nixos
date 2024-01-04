# Packages Configuration
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
      htop
      inxi
      iproute2
      killall
      neofetch
      ntfs3g
      rustdesk
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
