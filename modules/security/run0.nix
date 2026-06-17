{...}: {
  flake.nixosModules.run0 = {...}: {
    security = {
      run0 = {
        enable = true;
        enableSudoAlias = true;
        wheelNeedsPassword = true;
      };
    };
  };
}
