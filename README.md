# VictoryNixOS config files

I wanted a completly modular setup for NixOS. 

This repo contains all the files I have stripped from the configuration.nix to individualize as many components as I could. I sometimes use NixOS as a desktop pc but mostly as a server, and not all modules are necessary or wanted in a server setup. So making them all modules makes it easier to add, and remove parts as you need them or no longer need them.

```
nix-shell -p git

```
git clone http://github.com/victorytek/VictoryNixos

```
cd VictoryNixos

```
./setup.sh
```