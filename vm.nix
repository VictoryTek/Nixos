{ config, pkgs, ... }:

{

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Add user to libvirtd group
  users.users.nimda.extraGroups = [ "libvirtd" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    nur.repos.dukzcry.cockpit-client
    nur.repos.dukzcry.cockpit-machines
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    -netdev tap,id=net0,br=virbr0,helper=$(type -p qemu-bridge-helper)
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  services.cockpit.enable = true;


}
