{ config, pkgs, ... }:

{

  # Docker setup
  virtualisation.docker.enable = true;

  # Add user to libvirtd group
  users.users.nimda.extraGroups = [ "docker" ];

}
