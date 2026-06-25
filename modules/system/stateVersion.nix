{...}: {
  flake.nixosModules.stateVersion = {...}: {
    system = {
      stateVersion = "25.11";
    };
  };
}
