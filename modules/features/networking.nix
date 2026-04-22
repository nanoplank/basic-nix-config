{
  flake.nixosModules.networking = {...}: {
    networking = {
      networkmanager.enable = true;
      hostName = "nixos";

      # Firewall
      firewall.enable = true;
      firewall.allowedTCPPorts = [9757];
      firewall.allowedUDPPorts = [9757 5353];
    };

    services = {
      tailscale.enable = true;
      openssh.enable = true;

      avahi = {
        enable = true;
        openFirewall = true;
        nssmdns4 = true;
        publish.enable = true;
        publish.userServices = true;
      };
    };

    boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
    boot.kernel.sysctl."net.ipv6.ip_forward" = 1;
  };
}
