# Tailscale Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable DHCP Networking
  services = {
    tailscale = {
      enable = true;
    }
  }

  networking = {
    firewall = {
        allowedUDPPorts = [ ${services.tailscale.port} ];
    };
  };

  environment.systemPackages = with pkgs; [ tailscale ];

}