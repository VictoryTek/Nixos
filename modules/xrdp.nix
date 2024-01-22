# XRDP Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

    services = {
        xserver = {
            enable = true;
            displayManager = {
                gdm = {
                    enable = true;
                }
            };
            desktopManager = {
             gnome = {
                 enable = true;
             };     
            };
        };
       xrdp = {
           enable = true;
           defaultWindowManager = "gnome-session";
           openFirewall = true;
        };

    };

}