{inputs, ...}: {
  flake.nixosModules.hjem = {...}: {
    imports = [inputs.hjem.nixosModules.default];

    hjem = {
      users.nixed = {
        enable = true;
        directory = "/home/nixed";
        user = "nixed";
      };
      clobberByDefault = true;
    };
  };
}
