{ config, pkgs, ... }:

{

  # Docker setup
  virtualisation.docker.enable = true;

  # Add user to libvirtd group
  users.users.nimda.extraGroups = [ "docker" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
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
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

}
