# Tailscale Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable Tailscale
  services = {
    tailscale = {
      enable = true;
    }
  }

  # Open Tailscale network port
  services = {
    tailscale = {
      port = 41641;
    };
  };

  environment.systemPackages = with pkgs; [ tailscale ];

}