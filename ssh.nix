# SSH Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable SSH.
  services = {
    openssh = {
      enable = true;  # Enable the OpenSSH daemon.
    };
  };

}
