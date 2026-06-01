{...}: {
  flake.nixosModules.libvirtd = {
    pkgs,
    lib,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-protocol
      win-spice
    ];

    systemd.services.libvirtd.wantedBy = lib.mkForce [];

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
