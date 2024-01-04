# Plex Configuration (with Plexpass)
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  services.plex = let plexpass = pkgs.plex.override {
    plexRaw = pkgs.plexRaw.overrideAttrs(old: rec {
      version = "1.32.6.7371-b6a09ad81";
      src = pkgs.fetchurl {
        url = "https://downloads.plex.tv/plex-media-server-new/${version}/debian/plexmediaserver_${version}_amd64.deb";
        sha256 = "sha256-8PC3YW2RPPoUUFFKTgunQeJRnJIVpXHw2nAnV+OxIDc=";
      };
    });
  }; 
  in {
    enable = true;
    dataDir = "/var/lib/plex"; #sudo chmod 777 -R /var/lib/plex/Plex\ Media\ Server/
    openFirewall = true;
    package = plexpass;
  };
}
