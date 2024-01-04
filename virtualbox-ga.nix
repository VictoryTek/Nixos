# Virtualbox Guest Additions Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable Virtualbox Guest Additions.
  virtualisation = {
    virtualbox = {
      guest = {
        enable = true;
        x11 = true;
      };
    };
  };
}
