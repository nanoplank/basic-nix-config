{...}: {
  flake.nixosModules.syncthing = {...}: {
    services = {
      syncthing = {
        enable = true;
      };
    };
  };
}
