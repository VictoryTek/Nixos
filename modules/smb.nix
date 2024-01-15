# SAMBA Share Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Network Shares
  services.samba.enable = true;
  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';

  # Mount Media
  fileSystems."/goliath/data" = {
      device = "//192.168.100.19/data";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.d";

      in ["${automount_opts},credentials=/etc/nixos/.secrets/smb-data,uid=1000,rw"];
  };

  # Mount My_Media
  fileSystems."/goliath/my_data" = {
      device = "//192.168.100.19/my_data";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.d";

      in ["${automount_opts},credentials=/etc/nixos/.secrets/smb-mydata,uid=1000,rw"];
  };

}
