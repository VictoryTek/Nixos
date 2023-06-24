{ config, pkgs, ... }:

{

  # Docker setup
  virtualisation.docker.enable = true;

  # Add user to docker group
  users.users.nimda.extraGroups = [ "docker" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];

}
