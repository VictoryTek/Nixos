# Jellyfin Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  environment = {
    systemPackages = [
      pkgs.jellyfin
      pkgs.jellyfin-web
      pkgs.jellyfin-ffmpeg
    ];
  };

  services = {
    jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };

  # 1. enable vaapi on OS-level
  nixpkgs = {
    config = {
      packageOverrides = pkgs: {
        vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
        };
      };
    };
  
  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
      ];
    };
  };  

}
