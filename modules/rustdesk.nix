# RustDesk Remote Desktop application Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  environment.systemPackages = [
    pkgs.rustdesk
  ];

}