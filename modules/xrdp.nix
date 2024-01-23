# XRDP Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    services.xrdp.enable = true;
    services.xrdp.defaultWindowManager = "gnome-session";
    services.xrdp.openFirewall = true;
    services.xrdp.port = 3389;

# -------------------------------------------------------

#    services = {
#        xserver = {
#            enable = true;
#            displayManager = {
#                gdm = {
#                   enable = true;
#                };
#            };
#            desktopManager = {
#             gnome = {
#                 enable = true;
#             };     
#            };
#        };
#       xrdp = {
#           enable = true;
#           defaultWindowManager = "gnome-session";
#           openFirewall = true;
#        };
#
#    };

}