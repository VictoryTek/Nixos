# Uptime kuma Configuration
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Packages to be Installed.
  environment = {
    systemPackages = with pkgs; [
      uptime-kuma
      ];
  };

}
