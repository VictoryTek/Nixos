# Flakes enabling Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable Flakes and the new command-line tool
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
    # Flakes use Git to pull dependencies from data sources 
    git
    nano
    wget
    curl
    ];
  };
  # Set default editor to nano
  environment = {
    variables = {
      EDITOR = "nano";
    };
  };

}
