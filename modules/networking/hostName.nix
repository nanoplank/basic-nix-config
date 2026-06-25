{...}: {
  flake.nixosModules.hostName = {...}: {
    networking = {
      hostName = "nixos";
    };
  };
}
