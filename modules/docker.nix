# Docker Configuration
# https://github.com/VictoryTek
# Ver. 1.1

{ config, pkgs, ... }:

{

  # Docker setup
  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };

  # Add user to docker group
  users = {
    users = {
      nimda = {
        extraGroups = [ "docker" ];
      };
    };
  };

  # Install necessary packages
  environment.systemPackages = with pkgs; [
  docker-compose
  ];

}
