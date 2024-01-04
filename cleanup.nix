# Cleanup Configuration
# https://github.com/VictoryTek
# Ver. 1.0

# this file sets some basic configs for nix itself, like the --jobs flag for gcc
{ lib, config, pkgs, ... }:

{
  nix = {
    settings = {
      max-jobs = 12;
      cores = 0;
      auto-optimise-store = true;
    };
    gc = { # garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

}

# cant remember who this is forked from, but will give credit as soon as I figure that out.
