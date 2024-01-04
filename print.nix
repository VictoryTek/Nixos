# Printer Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable CUPS to print documents.
  services = {
    printing = {
      enable = true;
    };
  };

}
