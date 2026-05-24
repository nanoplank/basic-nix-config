{...}: {
  flake.nixosModules.hjem = {...}: {
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
