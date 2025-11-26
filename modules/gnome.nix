# Gnome Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable the GNOME Desktop Environment.
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm = {
          enable = true;
        };
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
    displayManager = {
      autoLogin = {
        enable = true;
        user = "nimda";
      };
    };
  };

  # Workaround for GNOME autologin & Disable the GNOME3/GDM auto-suspend feature that cannot be disabled in GUI: (https://github.com/NixOS/nixpkgs/issues/103746#issueco>)
  systemd = {
    services = {
      "getty@tty1" = {
        enable = false;
      };
      "autovt@tty1" = {
        enable = false;
      };
    };
    targets = {
      sleep = {
        enable = false;
      };
      suspend = {
        enable = false;
      };
      hibernate = {
        enable = false;
      };
      hybrid-sleep = {
        enable = false;
      };
    };
  };

  # Packages to be removed
  environment = {
    gnome = {
      excludePackages = with pkgs; [
        gnome-photos
        gnome-tour
        cheese # webcam tool
        gnome-music
        epiphany # web browser
        geary # email reader
        evince # document viewer
        gnome-characters
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        gnome-maps
        gnome-clocks
        gnome-weather
      ];
    };
  };

  # Install necessary packages
  environment = {
    systemPackages = with pkgs; [
      gnome-tweaks
    ];
  };
  
}
