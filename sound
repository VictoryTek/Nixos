# Sound Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable sound with pipewire.
  sound = {
    enable = true;
  };
  hardware = {
    pulseaudio = {
      enable = false;
    };
  };
  security = {
    rtkit = {
      enable = true;
    };
  };
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

}
