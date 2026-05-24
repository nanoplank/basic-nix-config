{inputs, ...}: {
  flake.nixosModules.hjem = {...}: {
    imports = [inputs.hjem.nixosModules.default];

    hjem = {
      extraModules = [
        inputs.hjem-rum.hjemModules.default
      ];
      users.nixed = {
        enable = true;
        directory = "/home/nixed";
        user = "nixed";
      };
      clobberByDefault = true;
    };
  };
}
