{...}: {
  flake.nixosModules.connectivity = {...}: {
    hardware = {
      bluetooth = {
        enable = true;
      };
    };

    networking = {
      networkmanager = {
        enable = true;
      };
      hostName = "nixos";

      # Firewall
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
