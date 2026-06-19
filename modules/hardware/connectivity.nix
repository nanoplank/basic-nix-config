{...}: {
  flake.nixosModules.connectivity = {...}: {
    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = false;
      };
    };

    networking = {
      networkmanager = {
        enable = true;
      };
      hostName = "nixos";

      firewall = {
        enable = true;
        allowedTCPPorts = [9757 5353];
        allowedUDPPorts = [9757 5353];
      };
    };
    #    boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
    #    boot.kernel.sysctl."net.ipv6.ip_forward" = 1;
  };
}
