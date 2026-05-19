{...}: {
  flake.nixosModules.virtualization = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      #  win-virtio
      #  win-spice
    ];

    virtualisation = {
      libvirtd = {
        enable = true;
      };
    };

    services = {
      spice-vdagentd.enable = true;
    };
  };
}
