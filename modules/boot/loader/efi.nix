{...}: {
  flake.nixosModules.efi = {...}: {
    boot = {
      loader = {
        efi = {
          canTouchEfiVariables = true;
        };
      };
    };
  };
}
