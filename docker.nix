{ config, pkgs, ... }:

{

  # Docker setup
  virtualisation.docker.enable = true;

  # Add user to libvirtd group
  users.users.nimda.extraGroups = [ "docker" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];

}
