{...}: {
  flake.nixosModules.hjem = {inputs, ...}: {
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
