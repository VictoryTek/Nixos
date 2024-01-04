# User Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Define a user account. Dont forget to set a password with ‘passwd’.
  users = {
    users = {
      nimda = {
        isNormalUser = true;
        description = "Nimda";
        extraGroups = [ "networkmanager" "wheel" ];
      };
    };
  };

}
