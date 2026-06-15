{...}: {
  flake.nixosModules.run0 = {...}: {
    security = {
      run0 = {
        enableSudoAlias = true;
        wheelNeedsPassword = true;
      };
    };
  };
}
