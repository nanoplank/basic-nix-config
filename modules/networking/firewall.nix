{...}: {
  flake.nixosModules.firewall = {...}: {
    networking = {
      firewall = {
        enable = true;
        allowedTCPPorts = [9757 5353];
        allowedUDPPorts = [9757 5353];
      };
    };
  };
}
