# NUR Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable NUR (Nix User Repo)
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

}
