# QEMU KVM + Virt Manager Configuration
# https://github.com/VictoryTek
# Ver. 1.0

{ config, pkgs, ... }:

{

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Add user to libvirtd group
  users.users.nimda.extraGroups = [ "libvirtd" ];

  # Enable cockpit ports
  services.cockpit.openFirewall = true;
  services.cockpit.port = 9090;

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    #nur.repos.dukzcry.cockpit-client
    #cockpit
    #nur.repos.dukzcry.cockpit-machines
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
    usbutils
    qemu_kvm
    libvirt
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      allowedBridges = [ "br0" ];
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  services.cockpit.enable = true;


}
