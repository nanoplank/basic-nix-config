{...}: {
  flake.nixosModules.sudo = {...}: {
    security = {
      sudo = {
        enable = false;
      };
    };
  };
}
