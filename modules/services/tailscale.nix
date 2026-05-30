{...}: {
  flake.nixosModules.tailscale = {...}: {
    services = {
      tailscale = {
        enable = true;
        useRoutingFeatures = "server";
      };
    };
  };
}
