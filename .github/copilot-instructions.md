# AI Agent Guidance
**Before making any changes or development, always use and reference:**
- `#context7_get-library-docs` for up-to-date documentation on NixOS modules, options, and packages.
- `#context7_resolve-library-id` to resolve and verify package/library names and IDs.
- `#codebase` to search, analyze, and cross-reference the current project structure and code.

This ensures all changes are accurate, compatible with the latest NixOS standards, and consistent with the current codebase.
# Copilot Instructions for VictoryTek NixOS Modular Config

## Project Overview
- This repo is a modular NixOS configuration system, splitting `configuration.nix` into many focused modules under `modules/`.
- Designed for both server and desktop use; modules can be enabled/disabled as needed for the target system.
- The main entrypoint is `configuration.nix`, which imports modules from subdirectories (e.g., `modules/system/users.nix`, `modules/de/gnome.nix`).

## Key Structure & Patterns
- All system configuration is modularized. Each `.nix` file in `modules/` configures a specific service, feature, or package set.
- Modules are grouped by function: `de/` (desktop), `network/`, `services/`, `system/`, `installs/`.
- Secrets (e.g., SMB credentials) are handled via the `secrets/` directory and moved to `.secrets` with restricted permissions by `setup.sh`.
- The `setup.sh` script automates copying modules into `/etc/nixos/`, updating channels, switching configs, and rebooting.
- Updates and upgrades are managed by `update.sh` and `Version_Upgrade.sh` (see README for usage).

## Developer Workflows
- To apply config: run `sudo nixos-rebuild switch` (invoked by `setup.sh`).
- To update channels: `sudo nix-channel --update`.
- To upgrade NixOS version: use `Version_Upgrade.sh`.
- To add/remove features, edit the relevant module in `modules/` and update the import list in `configuration.nix`.
- For new modules, follow the pattern: `{ config, pkgs, ... }: { ... }` and export options as needed.

## Conventions & Gotchas
- Use top-level package names (e.g., `pkgs.cheese` not `pkgs.gnome.cheese`) for NixOS 24.05+ compatibility.
- Deprecated options (e.g., `services.xserver.displayManager.autoLogin`) must be updated to current names (`services.displayManager.autoLogin`).
- Only move/copy modules that are actually imported in `configuration.nix`.
- All scripts assume the user has sudo privileges and is running on NixOS.
- Avoid hardcoding user-specific values unless necessary (e.g., autoLogin user).

## Key Files & Directories
- `configuration.nix`: Main config, imports modules.
- `modules/`: All modular configs (grouped by function).
- `setup.sh`: Main automation script for initial setup and config application.
- `update.sh`, `Version_Upgrade.sh`: Scripts for updating and upgrading the system.
- `README.md`: Basic usage and workflow instructions.

## Example: Adding a New Service
1. Create `modules/services/myservice.nix`.
2. Add to `imports` in `configuration.nix`.
3. Run `setup.sh` or `sudo nixos-rebuild switch`.

---
For more, see the README and comments in each module. Keep all new modules minimal, focused, and well-commented.
